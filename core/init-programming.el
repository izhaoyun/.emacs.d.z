(defun init-company ()
  (use-package company
    :init
    (setq company-show-numbers t)
    (company-mode 1)
    )
)

(defun init-auto-complete ()
  (use-package auto-complete-config
    :ensure auto-complete
    :init
    (ac-config-default)
    )
  )

(defun init-magit ()
  (use-package magit
    :pin popkit
    :bind
    (("C-x g" . magit-status)
     ("C-x G" . magit-status-with-prefix))
    )
  )

(defun init-comment-dwim-2 ()
  (use-package comment-dwim-2
    :bind
    ("M-;" . comment-dwim-2))
  )

(defun init-clean-aindent-mode ()
  (use-package clean-aindent-mode
    :init
    (add-hook 'prog-mode-hook 'clean-aindent-mode)
    )
  )

(use-package yafolding)

(use-package projectile
  :diminish projectile-mode
  :init
  (setq projectile-enable-caching t)
  (setq projectile-completion-system 'ivy)
  (setq projectile-indexing-method 'alien)
  (projectile-global-mode)
  (add-hook 'projectile-mode-hook 'init-comment-dwim-2)
  :config
  (add-hook 'projectile-mode-hook 'init-clean-aindent-mode)
  )

(provide 'init-programming)
