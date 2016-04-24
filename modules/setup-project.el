(use-package projectile
  :defer 5
  :diminish projectile-mode
  :commands projectile-global-mode
  :init
  (setq projectile-enable-caching t)
  (setq projectile-file-exists-remote-cache-expire (* 10 60))
  :config
  (use-package helm-projectile
    :config
    (setq projectile-completion-system 'helm)
    (helm-projectile-on))
  (projectile-global-mode))

(provide 'setup-project)
