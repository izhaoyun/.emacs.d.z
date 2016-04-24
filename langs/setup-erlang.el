(use-package erlang
  :mode
  (("\\.erl\\'" . erlang-mode)
   ("\\.hrl\\'" . erlang-mode))
  :init
  (setq erlang-root-dir "/usr/lib/erlang") ; On Arch Linux
  (add-to-list 'exec-path "/usr/lib/erlang/bin")
  (setq erlang-man-root-dir "/usr/lib/erlang/man")
  (add-hook 'erlang-mode-hook (lambda () (run-hooks 'prog-mode-hook)))
  (setq erlang-compile-extra-opts '(debug_info))
  :config)

(provide 'setup-erlang)
