(setq vc-handled-backends nil)

(defun auto-fill-comments ()
  (auto-fill-mode 1)
  (setq comment-auto-fill-only-comments t)
  )
(add-hook 'prog-mode-hook 'auto-fill-comments)


(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(global-set-key (kbd "RET") 'newline-and-indent)

(use-package dtrt-indent
  :diminish dtrt-indent-mode
  :config
  (dtrt-indent-mode 1))


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

(defun init-semantic-stickyfunc-enhance ()
  (use-package stickyfunc-enhance
    :init
    (add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)
    (semantic-mode 1))
  )

(provide 'setup-develop)
