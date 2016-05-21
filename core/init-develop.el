;; (defun init-company ()
;;   (use-package company
;;     :init
;;     (setq company-show-numbers t)
;;     (company-mode 1))
;; )

(defun init-auto-complete ()
  (use-package auto-complete-config
    :ensure auto-complete
    :init
    (ac-config-default)
    (auto-complete-mode))
  )
(add-hook 'emacs-lisp-mode-hook 'init-auto-complete)

(use-package magit
  :defer t
  :bind
  ("C-x g" . magit-status))
  
(defun init-comment ()
  (use-package comment-dwim-2
    :bind
    ("M-;" . comment-dwim-2)
    )
  ;; auto fill only comments
  (auto-fill-mode 1)
  (setq comment-auto-fill-only-comments t)
  )
(add-hook 'prog-mode-hook 'init-comment)

;; indentation
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(global-set-key (kbd "RET") 'newline-and-indent)

(defun init-indent ()
  (use-package clean-aindent-mode
    :init
    (clean-aindent-mode 1))

  (use-package dtrt-indent
    :config
    (dtrt-indent-mode 1))

  (use-package indent-guide
    :diminish indent-guide-mode
    :init
    (indent-guide-global-mode))
  )
(add-hook 'prog-mode-hook 'init-indent)

(use-package ws-butler
  :diminish ws-butler-mode
  :init
  (ws-butler-mode))

(use-package yasnippet
  :commands yas-global-mode
  :init
  (yas-global-mode 1))

(defun init-flycheck ()
  (use-package flycheck
    :commands flycheck-mode
    :init
    (flycheck-mode)
    (setq flycheck-check-syntax-automatically
          '(mode-enabled save)))
  )
(add-hook 'prog-mode-hook 'init-flycheck)

(use-package projectile
  :diminish projectile-mode
  :commands projectile-global-mode
  :init
  (setq projectile-verbose nil)
  (setq projectile-enable-caching t)
  (setq projectile-completion-system 'ivy)
  (setq projectile-indexing-method 'alien)
  (projectile-global-mode)
  )

(defun init-semantic-stickyfunc-enhance ()
  (use-package stickyfunc-enhance
    :init
    (add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)
    (semantic-mode 1))
  )

(provide 'init-develop)
