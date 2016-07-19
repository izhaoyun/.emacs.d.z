(package-initialize)
(mapc #'(lambda (path)
	  (add-to-list 'load-path
		       (expand-file-name path user-emacs-directory)))
      '("site-lisp" "lisp" "lib/use-package"))

(require 'cl)

(defvar use-package-verbose t)
(require 'use-package)

(require 'bind-key)
(use-package diminish :load-path "site-lisp/diminish")

(use-package avy
  :load-path "site-lisp/avy"
  :commands (avy-setup-default)
  :bind (("C-:" . avy-goto-char)
	 ("M-p" . avy-pop-mark))
  :init
  (avy-setup-default)
  :config
  (setq avy-all-windows nil)
  (setq avy-timeout-seconds 0.8)
  (advice-add 'swiper :before 'avy-push-mark))

(use-package swiper
  :load-path "site-lisp/swiper"
  :bind (("C-s" . counsel-grep-or-swiper)
	 ("C-r" . ivy-resume)
	 ("M-x" . counsel-M-x)
	 ("M-y" . counsel-yank-pop)
	 ("C-x C-f" . counsel-find-file)
	 ("C-h l"   . counsel-load-library)
	 ("C-x r b" . counsel-bookmark)
	 ("C-c s a" . counsel-ag)
	 ("C-c s g" . counsel-git)
	 ("C-c s i" . counsel-imenu)
	 ("C-c s p" . counsel-git-grep)
	 ("C-c s l" . counsel-locate)
	 ("C-c s t" . counsel-tmm)
	 ("C-c s r" . counsel-linux-app))
  :bind (:map help-map
	      ("b" . counsel-descbinds)
	      ("f" . counsel-describe-function)
	      ("v" . counsel-describe-variable)
	      ("s" . counsel-info-lookup-symbol))
  :init
  (ivy-mode)
  :config
  (setq ivy-display-style 'fancy)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) "))

(use-package which-key
  :load-path "site-lisp/which-key"
  :diminish which-key-mode
  :commands (which-key-mode
	     which-key-setup-side-window-right-bottom)
  :init
  (which-key-mode)
  (which-key-setup-side-window-right-bottom))

(use-package projectile
  :load-path "site-lisp/projectile"
  :commands (projectile-global-mode)
  :init
  (projectile-global-mode)
  (setq projectile-completion-system 'ivy)
  (setq projectile-switch-project-action #'projectile-dired)
  )

(use-package python-mode
  :load-path "site-lisp/python-mode"
  :config)

(use-package yasnippet
  :load-path "site-lisp/yasnippet"
  :commands (yas-reload-all
	     yas-minor-mode)
  :init
  (yas-reload-all)
  (add-hook 'prog-mode-hook #'yas-minor-mode))

(use-package tramp
  :config
  (setq tramp-default-method "ssh"))
