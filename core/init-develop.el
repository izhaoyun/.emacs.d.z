(defun init-company ()
  (use-package company
    :init
    (setq company-show-numbers t)
    (company-mode 1))
)

(defun init-auto-complete ()
  (use-package auto-complete-config
    :ensure auto-complete
    :init
    (ac-config-default))
  )

(use-package magit
  :defer t
  :bind
  (("C-x g" . magit-status)
   ("C-x G" . magit-status-with-prefix)))

(use-package comment-dwim-2
  :bind
  ("M-;" . comment-dwim-2))

(add-hook 'prog-mode-hook
          (lambda ()
            (auto-fill-mode 1)
            (setq comment-auto-fill-only-comments t)))

(use-package clean-aindent-mode
  :init
  (clean-aindent-mode 1))

(use-package dtrt-indent
  :init
  (dtrt-indent-mode 1))

(use-package ws-butler
  :diminish ws-butler-mode
  :init
  (ws-butler-mode))

(use-package yasnippet
  :init
  (yas-global-mode 1))

(use-package indent-guide
  :diminish indent-guide-mode
  :init
  (indent-guide-global-mode))

;;(defun init-flycheck ()
;;  (use-package flycheck
;;    :init
;;    (flycheck-mode))
;;  )

(use-package projectile
  :diminish projectile-mode
  :init
  (projectile-global-mode)
  (setq projectile-enable-caching t)
  (setq projectile-completion-system 'ivy)
  (setq projectile-indexing-method 'alien)
  :config)

(defun init-semantic-stickyfunc-enhance ()
  (use-package stickyfunc-enhance
    :init
    (add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)
    (semantic-mode 1))
  )

(provide 'init-develop)
