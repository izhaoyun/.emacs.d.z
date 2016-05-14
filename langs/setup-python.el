(use-package python
  :mode ("\\.py$" . python-mode)
  :init
  (add-hook 'python-mode-hook 'init-auto-complete)
  (use-package jedi
    :init
    (add-hook 'python-mode-hook 'jedi:setup)
    (setq jedi:complete-on-dot t))
  :config)

(provide 'setup-python)
