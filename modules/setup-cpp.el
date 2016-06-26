(use-package cmake-mode
  :mode (("CMakeLists.txt\\'" . cmake-mode)
         ("\\.cmake\\'" . cmake-mode)))

(use-package irony-mode
  :ensure irony
  :init
  (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'c-mode-hook 'irony-mode)
  (add-hook 'objc-mode-hook 'irony-mode)
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

(defun cpp/init-company-irony ()
  (use-package company-irony
    :init
    (push 'company-irony company-backends))
  )
(add-hook 'c-mode-common-hook 'cpp/init-company-irony)

(use-package irony-eldoc
  :init
  (add-hook 'irony-mode-hook 'irony-eldoc)
  )

(defun cpp/init-company-c-headers ()
  (use-package company-c-headers
    :init
    (push 'company-c-headers company-backends))
  )
(add-hook 'c-mode-common-hook 'cpp/init-company-c-headers)

(use-package cmake-ide
  :init
  (cmake-ide-setup)
  )

(use-package cc-mode
  :mode (("\\.h\\'" . c++-mode))
  :bind
  ("RET" . newline-and-indent)
  :init
  (setq c-default-style "linux")
  (setq indent-tabs-mode nil)
  (setq-default c-basic-offset 4)
  (add-hook 'c-mode-common-hook 'hs-minor-mode)
  :config
  )

(provide 'setup-cpp)
