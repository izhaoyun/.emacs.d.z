(use-package cmake-mode
  :mode (("CMakeLists.txt\\'" . cmake-mode)
         ("\\.cmake\\'" . cmake-mode)))

(use-package ggtags
  :init
  (add-hook 'c-mode-common-hook 'ggtags-mode)
  :bind
  (:map ggtags-mode-map
        ("C-c g s" . ggtags-find-other-symbol)
        ("C-c g d" . ggtags-find-definition)
        ("C-c g h" . ggtags-view-tag-history)
        ("C-c g r" . ggtags-find-reference)
        ("C-c g f" . ggtags-find-file)
        ("C-c g c" . ggtags-create-tags)
        ("C-c g u" . ggtags-update-tags)
        ("C-," . pop-tag-mark)
        ("M-." . ggtags-find-tag-dwim)
        )
  :config
  (setq-local imenu-create-index-function #'ggtags-build-imenu-index)
  (setq-local eldoc-documentation-function #'ggtags-eldoc-function)
  (setq-local hippie-expand-try-functions-list
              (cons 'ggtags-try-complete-tag hippie-expand-try-functions-list))
  )


(defun cpp/init-company-c-headers ()
  (use-package company-c-headers
    :init
    (push 'company-c-headers company-backends))
  )
(add-hook 'c-mode-common-hook 'cpp/init-company-c-headers)

(defun cpp/init-cmake-ide ()
  (use-package cmake-ide
    :init
    (cmake-ide-setup)
    )
  )
(add-hook 'c-mode-common-hook 'cpp/init-cmake-ide)

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
