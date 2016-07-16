(use-package erlang-start
  :ensure erlang
  :mode (("\\.erl?$" . erlang-mode)
         ("\\.hrl?$" . erlang-mode))
  :init
  (setq erlang-root-dir "/usr/lib/erlang")
  (setq exec-path (cons "/usr/lib/erlang/bin" exec-path))
  )
(provide 'setup-erlang)
