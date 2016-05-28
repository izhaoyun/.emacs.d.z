(setq vc-handled-backends nil)

(use-package magit
  :defer t
  :bind
  ("C-x g" . magit-status))

(defun auto-fill-comments ()
  (auto-fill-mode 1)
  (setq comment-auto-fill-only-comments t)
  )
(add-hook 'prog-mode-hook 'auto-fill-comments)

(use-package comment-dwim-2
  :bind
  ("M-;" . comment-dwim-2))

(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(global-set-key (kbd "RET") 'newline-and-indent)

(use-package clean-aindent-mode
  :init
  (clean-aindent-mode 1))

(use-package dtrt-indent
  :diminish dtrt-indent-mode
  :config
  (dtrt-indent-mode 1))

(use-package indent-guide
  :diminish indent-guide-mode
  :init
  (indent-guide-global-mode))

(use-package aggressive-indent
  :config
  (global-aggressive-indent-mode 1))

(use-package ws-butler
  :diminish ws-butler-mode
  :init
  (ws-butler-mode))

(use-package yasnippet
  :commands (yas-reload-all
             yas-minor-mode)
  :init
  (yas-reload-all)
  (add-hook 'prog-mode-hook #'yas-minor-mode)
  :config
    (use-package company-yasnippet
      :ensure company
      :commands company-yasnippet
      :bind
      ("C-c ; y" . company-yasnippet))
  )


(use-package flycheck
  :commands   flycheck-mode
  :init
  (global-flycheck-mode)
  (setq flycheck-check-syntax-automatically
        '(mode-enabled save))
  :config
  (use-package flycheck-pos-tip
    :init
    (flycheck-pos-tip-mode)))

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

(provide 'setup-develop)
