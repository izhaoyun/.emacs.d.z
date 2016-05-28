(use-package irony
  :diminish irony-mode
  :init
)
(add-hook 'c-mode-common-hook 'irony-mode)

(defun init-company-for-c/c++ ()
  (use-package company
    :init
    (setq company-show-numbers t)
    (company-mode 1)
    (setq company-backends (delete 'company-semantic company-backends)))
  (use-package company-c-headers
    :init
    (add-to-list 'company-backends 'company-c-headers))
  )

(use-package cc-mode
  :mode (("\\.h\\'" . c++-mode))
  :bind
  ("RET" . newline-and-indent)
  :init
  (setq c-default-style "linux")
  (setq indent-tabs-mode nil)
  (setq c-basic-offset 4)

  (add-hook 'c-mode-common-hook 'hs-minor-mode)
  (add-hook 'c-mode-common-hook 'init-company-for-c/c++)
  (add-hook 'c-mode-common-hook 'init-semantic-stickyfunc-enhance)
  )

(provide 'setup-cpp)
