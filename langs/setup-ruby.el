(defun init-bundler ()
  (use-package bundler
    :defer t)
  )

(defun init-inf-ruby ()
  "inf-ruby provides a REPL buffer connected to a Ruby
subprocess."
  (use-package inf-ruby
    :init)
  )

(defun init-rubocop ()
  "A simple Emacs interface for RuboCop."
  (use-package rubocop
    :defer t)
  )

(defun init-robe ()
  (use-package robe
    :init
    (robe-mode)
    :config
    (eval-after-load 'company
      '(push 'company-robe company-backends)))
  )

(use-package ruby-mode
  :mode "\\.rb\\'"
  :interpreter "ruby"
  :init
  (add-hook 'ruby-mode-hook 'init-company)
  :config
  (add-hook 'ruby-mode-hook 'init-robe)
  (add-hook 'ruby-mode-hook 'init-rubocop)
  ;; (add-hook 'ruby-mode-hook 'init-inf-ruby)
  (add-hook 'ruby-mode-hook 'init-bundler))

(provide 'setup-ruby)
