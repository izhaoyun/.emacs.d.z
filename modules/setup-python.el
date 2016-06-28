(use-package python-mode
  :ensure python-mode
  :mode ("\\.py\\'" . python-mode)

  :init

  :config

  )

(defun python/init-fill-column-indicator ()
  (use-package fill-column-indicator
    :init
    (fci-mode 1)))
(add-hook 'python-mode-hook 'python/init-fill-column-indicator)

(provide 'setup-python)
