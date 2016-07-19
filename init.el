(package-initialize)
(setq load-prefer-newer t)
(eval-and-compile
  (mapc #'(lambda (path)
	    (add-to-list 'load-path
			 (expand-file-name path user-emacs-directory)))
	'("site-lisp" "lib/use-package"))

  (require 'cl)

  (defvar use-package-verbose t)
  (require 'use-package))

(require 'bind-key)
(use-package diminish :load-path "site-lisp/diminish")

(eval-and-compile
  (add-to-list 'load-path (expand-file-name "lib" user-emacs-directory)))
(use-package dash    :defer t :load-path "lib/dash")

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

(use-package counsel
  :load-path "site-lisp/swiper"
  :commands (ivy-mode)
  :bind (("C-s" . counsel-grep-or-swiper)
	 ("M-x" . counsel-M-x)
	 ("M-y" . counsel-yank-pop)
	 ("C-x C-f" . counsel-find-file)
	 ("C-h l"   . counsel-load-library)
	 ("C-x C-r" . ivy-resume)
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
  (ivy-mode 1)
  :config
  (setq ivy-use-virtual-buffers t)
  (setq ivy-display-style 'fancy)
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

(use-package company
  :load-path "site-lisp/company-mode"
  :commands (company-mode)
  :init
  (add-hook 'prog-mode-hook #'company-mode)
  :config
  (setq company-show-numbers t)
  (setq company-tooltip-limit 20)
  (use-package company-yasnippet
    :bind ("C-<tab>" . company-yasnippet)))

(use-package tramp
  :defer 10
  :config
  (setq tramp-default-method "ssh"))

(use-package magit
  :load-path "site-lisp/magit"
  :commands (magit-status)
  :bind
  ("C-x g" . magit-status))

(use-package sunrise-commander
  :load-path "site-lisp/sunrise-commander")

(when window-system
  (tooltip-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1))
