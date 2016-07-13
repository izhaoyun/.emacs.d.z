(defconst cpp-packages
  '(cmake-mode
    company-c-headers
    rtags
    irony)
  )

(install-pkgs cpp-packages)

(use-package cmake-mode
  :mode (("CMakeLists.txt\\'" . cmake-mode)
         ("\\.cmake\\'" . cmake-mode))
  )

(use-package cc-mode
  :mode (("\\.h\\'" . c++-mode))
  :bind
  ("RET" . newline-and-indent)
  :init
  (setq c-default-style "linux")
  (setq indent-tabs-mode nil)
  (setq-default c-basic-offset 4)
  :config
  (add-hook 'c-mode-common-hook 'hs-minor-mode)
  )

(defun cpp/init-company-c-headers ()
  (use-package company-c-headers
    :init
    (push 'company-c-headers company-backends))
  )
(add-hook 'c-mode-common-hook 'cpp/init-company-c-headers)

(defun cpp/init-gdb ()
  (setq gdb-many-windows t)
  (setq gdb-show-main t)
  )
(add-hook 'c-mode-common-hook 'cpp/init-gdb)

(defun init-rtags ()
  (require 'rtags)
  (rtags-start-process-unless-running)

  (rtags-enable-standard-keybindings)
  ;; enable rtags-diagnostics
  (setq rtags-autostart-diagnostics t)
  ;; enable rtags-completions-enabled
  (setq rtags-completions-enabled t)
  )
(add-hook 'c-mode-common-hook 'init-rtags)
(add-hook 'c++-mode-common-hook 'init-rtags)

(use-package irony
  :init
  (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'c-mode-hook 'irony-mode)
  :config
  ;; replace the `completion-at-point' and `complete-symbol' bindings in
  ;; irony-mode's buffers by irony-mode's function
  (defun my-irony-mode-hook ()
    (define-key irony-mode-map [remap completion-at-point]
      'irony-completion-at-point-async)
    (define-key irony-mode-map [remap complete-symbol]
      'irony-completion-at-point-async))
  (add-hook 'irony-mode-hook 'my-irony-mode-hook)
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
  )

(provide 'setup-cpp)
