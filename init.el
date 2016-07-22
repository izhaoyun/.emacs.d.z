(setq gc-cons-threshold 104857600)

(eval-and-compile
  (setq inhibit-startup-message t)
  (when window-system
    (menu-bar-mode   -1)
    (tooltip-mode    -1)
    (tool-bar-mode   -1)
    (scroll-bar-mode -1))

  (global-font-lock-mode 1)
  (column-number-mode 1)

  (defalias 'yes-or-no-p 'y-or-n-p))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(package-initialize)
(eval-and-compile
  (mapc #'(lambda (path)
        (add-to-list 'load-path
             (expand-file-name path user-emacs-directory)))
    '("site-lisp" "lib/use-package"))

  (require 'cl)
  (defvar use-package-verbose t)
  (require 'use-package))

(setq load-prefer-newer t)
(eval-and-compile
  (defun recompile-elisp-file ()
    (interactive)
    (when (and buffer-file-name (string-match "\\.el" buffer-file-name))
      (let ((byte-file (concat buffer-file-name "\\.elc")))
    (if (or (not (file-exists-p byte-file))
        (file-newer-than-file-p buffer-file-name byte-file))
        (byte-compile-file buffer-file-name)))))
  (add-hook 'after-save-hook #'recompile-elisp-file))

(use-package bind-key)
(use-package diminish :load-path "site-lisp/diminish")

(eval-and-compile
  (add-to-list 'load-path (expand-file-name "lib" user-emacs-directory)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; loading libraries
(use-package dash :defer t :load-path "lib/dash")

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
  :defer 10
  :config
  (which-key-mode)
  (which-key-setup-side-window-right-bottom))

(use-package projectile
  :load-path "site-lisp/projectile"
  :bind-keymap ("C-c p" . projectile-command-map)
  :commands (projectile-global-mode)
  :init
  (projectile-global-mode)
  (setq projectile-completion-system 'ivy)
  (setq projectile-switch-project-action #'projectile-dired))

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
  (setq company-tooltip-limit 20))

(use-package company-yasnippet
  :after company
  :bind ("C-<tab>" . company-yasnippet))

(use-package clean-aindent-mode
  :load-path "site-lisp/clean-aindent-mode"
  :commands (clean-aindent-mode)
  :init
  (electric-indent-mode -1)
  (clean-aindent-mode 1))

(use-package aggressive-indent
  :load-path "site-lisp/aggressive-indent-mode"
  :diminish aggressive-indent-mode
  :commands (aggressive-indent-mode)
  :init
  (add-hook 'prog-mode-hook #'aggressive-indent-mode))

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

(use-package window-numbering
  :defer t
  :load-path "site-lisp/window-numbering"
  :commands (window-numbering-mode)
  :init
  (window-numbering-mode))

(use-package winner
  :if (not noninteractive)
  :commands (winner-mode)
  :defer 5
  :config
  (winner-mode))

(use-package electric-align
  :load-path "site-lisp/electric-align"
  :commands (electric-align-mode)
  :init
  (add-hook 'prog-mode-hook 'electric-align-mode))

(use-package comment-dwim-2
  :load-path "site-lisp/comment-dwim-2"
  :bind ("M-;" . comment-dwim-2))

(use-package hippie-exp
  :bind (("M-/" . hippie-expand))
  :preface
  )

(use-package ibuffer
  :bind ("C-x C-b" . ibuffer)
  :init
  (add-hook 'ibuffer-mode-hook
            #'(lambda ()
                (ibuffer-switch-to-saved-filter-groups "default"))))

(use-package expand-region
  :load-path "site-lisp/expand-region"
  :commands (er/expand-region
         er/contract-region)
  :bind (("C-=" . er/expand-region)
     ("C--" . er/contract-region)))

(use-package elec-pair
  :commands (electric-pair-mode)
  :init
  (electric-pair-mode)
  :config
  (setq electric-pair-pairs '((?\" . ?\")
                              (?\{ . ?\}))))

(use-package paren
  :init
  (show-paren-mode)
  :preface
  (defun match-paren (arg)
      "Go to the matching paren if on a paren; otherwise insert
%."
      (interactive "p")
      (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))
  :bind (("%" . match-paren))
  :config
  (setq show-paren-style 'expression))

(use-package rainbow-delimiters
  :load-path "site-lisp/rainbow-delimiters"
  :commands (rainbow-delimiters-mode)
  :init
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(use-package whitespace
  :commands (whitespace-cleanup
             whitespace-buffer
             whitespace-mode)
  :config
  (add-hook 'before-save-hook 'whitespace-cleanup))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(eval-and-compile
  (defun my/base-prog-mode ()
    (setq-default indent-tabs-mode nil)
    (setq-default tab-width 4)
    (setq show-trailing-whitespace 1)
    )
  (add-hook 'prog-mode-hook 'my/base-prog-mode))

(use-package org
  :load-path ("site-lisp/org-mode/lisp"
              "site-lisp/org-mode/contrib/lisp")
  :mode (("\\.org$" . org-mode)
         ("\\.txt$" . txt-mode))
  :bind (("C-c a" . org-agenda)
         ("C-c b" . org-iswitch)
         ("C-c c" . org-capture)
         ("C-c l" . org-store-link))
  )

(use-package cc-mode
  :mode (("\\.h\\(h?\\|xx\\|pp\\)\\'" . c++-mode))
  :preface
  (defun my/c-mode-common-hook ()
    (setq indent-tabs-mode nil)
    (setq c-default-style "linux")

    (hs-minor-mode 1)
    (diminish 'hs-minor-mode)

    (eldoc-mode 1)
    (diminish 'eldoc-mode)

    (hide-ifdef-mode 1)
    (diminish 'hide-ifdef-mode)

    (company-mode 1)

    (bind-key "<return>" #'newline-and-indent c-mode-base-map)
    (unbind-key "M-j" c-mode-base-map)
    )
  (defun setup-gdb ()
    (use-package gdb-mi
      :init
      (setq gdb-many-windows t)
      (setq gdb-show-main t)))
  :init
  (add-hook 'c-mode-common-hook 'my/c-mode-common-hook)
  :config
  (add-hook 'c-mode-common-hook 'setup-gdb))

(use-package cmake-mode
  :mode (("CMakeLists.txt\\'" . cmake-mode)
         ("\\.cmake\\'"       . cmake-mode)))

(use-package cmake-font-lock
  :after cmake-mode
  :load-path "site-lisp/cmake-font-lock"
  :commands (cmake-font-lock-activate)
  :init
  (add-hook 'cmake-mode-hook 'cmake-font-lock-activate))

(use-package python-mode
  :load-path "site-lisp/python-mode"
  :mode ("\\.py\\'" . python-mode)
  :interpreter ("python" . python-mode)
  ;; :bind-keymap ("C-x p" . python-mode-map)
  ;; :config
  )

;; (use-package go-mode
;;   :load-path "site-lisp/go-mode"
;;   :mode (("\\.go\\'" . go-mode))
;;   :commands (gofmt-before-save
;;              godoc
;;              go-remove-unused-imports
;;              gofmt)
;;   :preface
;;   (defun init-go ()

;;     )
;;   :init
;;   (add-hook 'go-mode-hook 'init-go)
;;   :config
;;   (progn
;;     (bind-key "<return>" #'newline-and-indent go-mode-map)
;;     (bind-key (kbd "C-c C-f l") 'godoc go-mode-map)
;;     (bind-key (kbd "C-c C-f e") 'go-remove-unused-imports go-mode-map)
;;     (bind-key (kbd "C-c C-f t") 'gofmt go-mode-map)
;;     )
;;   (add-hook 'before-save-hook 'gofmt-before-save))

(use-package markdown-mode
  :load-path "site-lisp/markdown-mode"
  :commands (markdown-mode
             gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode)))

(use-package nxml-mode
  :commands nxml-mode
  :init
  (defalias 'xml-mode 'nxml-mode)
  :config
  (defun my-nxml-mode-hook ()
    (bind-key "<return>" #'newline-and-indent nxml-mode-map))

  (add-hook 'nxml-mode-hook 'my-nxml-mode-hook)

  (defun tidy-xml-buffer ()
    (interactive)
    (save-excursion
      (call-process-region (point-min) (point-max) "tidy" t t nil
                           "-xml" "-i" "-wrap" "0" "-omit" "-q" "-utf8")))
  ;; should have tidy installed.
  (bind-key "C-c M-h" #'tidy-xml-buffer nxml-mode-map)

  (require 'hideshow)
  (require 'sgml-mode)

  (add-to-list 'hs-special-modes-alist
               '(nxml-mode
                 "<!--\\|<[^/>]*[^/]>"
                 "-->\\|</[^/>]*[^/]>"

                 "<!--"
                 sgml-skip-tag-forward
                 nil))

  (add-hook 'nxml-mode-hook 'hs-minor-mode)

  ;; optional key bindings, easier than hs defaults
  (bind-key "C-c h" #'hs-toggle-hiding nxml-mode-map))

(use-package restclient
  :load-path "site-lisp/restclient"
  :mode ("\\.rest\\'" . restclient-mode))
