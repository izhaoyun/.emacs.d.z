(defun init-company ()
  (use-package company
    :init
    (setq company-show-numbers t)
    )
  )

(defun init-magit ()
  (use-package magit
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

(use-package projectile
  :diminish projectile-mode
  :init
  (setq projectile-enable-caching t)
  (setq projectile-completion-system 'ivy)
  (setq projectile-indexing-method 'alien)
  (projectile-global-mode)
  )

(provide 'init-programming)
