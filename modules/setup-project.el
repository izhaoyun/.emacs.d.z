(defun init-magit ()
  (use-package magit
    :bind
    (("C-x g" . magit-status)
     ("C-x G" . magit-status-with-prefix)))
  )

(use-package projectile
  :diminish projectile-mode
  :init
  (setq projectile-enable-caching t)
  (setq projectile-file-exists-remote-cache-expire (* 10 60))
  (use-package helm-projectile
    :commands helm-projectile-on
    :init
    (setq projectile-completion-system 'helm)
    (helm-projectile-on))
  (projectile-global-mode)
  :config
  (add-hook 'projectile-mode-hook 'init-magit)
  )

(provide 'setup-project)
