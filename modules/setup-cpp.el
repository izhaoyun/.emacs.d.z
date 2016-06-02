(use-package irony
  :diminish irony-mode
  :defer t
  :init
  (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'c-mode-hook 'irony-mode)
  :config
  (defun my-irony-mode-hook ()
    (define-key irony-mode-map [remap completion-at-point]
      'irony-completion-at-point-async)
    (define-key irony-mode-map [remap complete-symbol]
      'irony-completion-at-point-async))
  (add-hook 'irony-mode-hook 'my-irony-mode-hook)
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options))

(use-package cmake-mode
  :mode ("CMakeLists\\.txt\\'" "\\.cmake\\'"))

(defun run-rtags ()
  (interactive)
  (use-package rtags
    :defer t
    :commands (rtags-start-process-unless-running
               )
    :init
    (add-hook 'c++-mode-common-hook 'rtags-start-process-unless-running)
    (rtags-enable-standard-keybindings c-mode-base-map "\C-cr")
    :bind

    :config
    )
  )

(use-package company-c-headers
  :init
  (push 'company-c-headers company-backends))

(use-package cc-mode
  :mode (("\\.h\\'" . c++-mode))
  :bind
  ("RET" . newline-and-indent)
  :init
  (setq c-default-style "linux")
  (setq indent-tabs-mode nil)
  (setq-default c-basic-offset 4)
  (add-hook 'c-mode-common-hook 'hs-minor-mode)
  )

(provide 'setup-cpp)
