(use-package go-mode
  :mode "\\.go\\'"
  :bind
  (:map go-mode-map
        ("C-c C-f R" . go-remove-unused-imports)
        ("C-c C-f F" . gofmt)
        ("C-c C-f D" . godoc)
        )
  :init
  ;; some configuration to be added.
  :config
  (add-hook 'before-save-hook 'gofmt-before-save)
  )

(provide 'setup-go)
