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

(use-package dash         :defer t :load-path "lib/dash")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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
  :bind-keymap ("C-c p" . projectile-command-map)
  :commands (projectile-global-mode)
  :init
  (projectile-global-mode)
  (setq projectile-completion-system 'ivy)
  (setq projectile-switch-project-action #'projectile-dired)
  )

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
  ;; (add-hook 'prog-mode-hook #'company-mode)
  :config
  (setq company-show-numbers t)
  (setq company-tooltip-limit 20)
  )

(use-package company-yasnippet
  :after company
  :bind ("C-<tab>" . company-yasnippet)
  )

(use-package tramp
  :defer 10
  :config
  (setq tramp-default-method "ssh"))

(use-package magit
  :load-path ("site-lisp/magit/lisp"
	      "site-lisp/with-editor")
  :bind ("C-x t g" . magit-status)
  :init
  (add-hook 'magit-mode-hook 'hl-line-mode))

(use-package sunrise-commander
  :load-path "site-lisp/sunrise-commander"
  :bind ("C-x t c" . sunrise))

(use-package org
  :load-path ("site-lisp/org-mode/lisp"
	      "site-lisp/org-mode/contrib/lisp")
  :mode (("\\.org\\'" . org-mode)
	 ("\\.txt\\'" . txt-mode))
  :bind (("C-c a" . org-agenda)
	 ("C-c b" . org-iswitch)
	 ("C-c c" . org-capture)
	 ("C-c l" . org-store-link))
  )

(use-package window-numbering
  :defer t
  :load-path "site-lisp/window-numbering"
  :commands (window-numbering-mode)
  :init
  (window-numbering-mode))

(use-package electric-align
  :load-path "site-lisp/electric-align"
  :commands (electric-align-mode)
  :init
  (add-hook 'prog-mode-hook 'electric-align-mode))

(use-package comment-dwim-2
  :load-path "site-lisp/comment-dwim-2"
  :bind ("M-;" . comment-dwim-2))

(use-package hippie-exp
  :bind ("M-/" . hippie-expand))

(use-package cc-mode
  :mode (("\\.h\\(h?\\|xx\\|pp\\)\\'" . c++-mode)
	 ("\\.m\\'" . c-mode)
	 ("\\.mm\\'" . c++-mode))
  :preface
  (defun my-c-mode-common-hook ()
    (bind-key "<return>" #'newline-and-indent c-mode-base-map)

    (hs-minor-mode 1)
    (diminish 'hs-minor-mode)

    (eldoc-mode 1)
    (diminish 'eldoc-mode)

    (company-mode 1)

    (setq gdb-many-windows t)
    (setq gdb-show-main t))
  :init
  (add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
  )

(use-package rtags
  :load-path "site-path/rtags"
  )

(use-package python
  :load-path "site-path/python-mode"
  :mode ("\\.py\\'" . python-mode)
  :interpreter ("python" . python-mode)
  ;; :bind-keymap ("C-x p" . python-mode-map)
  ;; :config
  )

(use-package expand-region
  :load-path "site-path/expand-region"
  :commands (er/expand-region
	     er/contract-region)
  :bind (("C-=" . er/expand-region)
	 ("C--" . er/contract-region)))

(use-package rainbow-delimiters
  :load-path "site-lisp/rainbow-delimiters"
  :commands (rainbow-delimiters-mode)
  :init
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(when window-system
  (tooltip-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1))
