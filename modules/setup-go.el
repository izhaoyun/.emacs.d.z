(use-package go-mode-autoloads
  :ensure go-mode
  :bind
  ("C-c C-f R" . go-remove-unused-imports)
  :config
  (add-hook 'before-save-hook 'gofmt-before-save)
  )

(provide 'setup-go)
