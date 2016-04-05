(use-package ruby-mode
  :mode "\\.rb\\'"
  :interpreter "ruby")

(use-package robe
  :defer 8
  :config
  (add-hook 'ruby-mode-hook 'robe-mode)
  (push 'company-robe company-backends))

(use-package inf-ruby
  :config
  (add-hook 'ruby-mode-hook 'inf-ruby-minor-mode)
  (add-hook 'compilation-filter-hook 'inf-ruby-auto-enter))

(provide 'init-ruby)
