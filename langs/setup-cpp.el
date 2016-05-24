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
  (add-hook 'c-mode-common-hook 'init-cmake-ide)
  (add-hook 'c-mode-common-hook 'init-ggtags)
  )

(defun init-cmake-ide ()
  ;; cmake-ide
  (use-package cmake-ide
    :init
    (cmake-ide-setup))
  )

(defun init-company-for-c/c++ ()
  (use-package company
    :init
    (setq company-show-numbers t)
    (company-mode 1)
    (setq company-backends (delete 'company-semantic company-backends)))
  (use-package company-c-headers
    :init
    (add-to-list 'company-backends 'company-c-headers)
    )
  )

(defun init-ggtags ()
  (use-package ggtags
    :bind
    (:map ggtags-mode-map
          ("C-c g s" . ggtags-find-other-symbol)
          ("C-c g d" . ggtags-find-definition)
          ("C-c g h" . ggtags-view-tag-history)
          ("C-c g r" . ggtags-find-reference)
          ("C-c g f" . ggtags-find-file)
          ("C-c g c" . ggtags-create-tags)
          ("C-c g u" . ggtags-update-tags)
          ("C-,"     . pop-tag-mark))
    :init
    (ggtags-mode 1)
    (setq-local imenu-create-index-function #'ggtags-build-imenu-index)
    ;; (setq-local eldoc-documentation-function #'ggtags-eldoc-function)
    (setq-local hippie-expand-try-functions-list
                (cons 'ggtags-try-complete-tag hippie-expand-try-functions-list)))
  )

;; (use-package c-eldoc
;;   :init
;;   (setq c-eldoc-buffer-regenerate-time 60)
;;   :config
;;   (add-hook 'c-mode-hook 'c-turn-on-eldoc-mode)
;;   (add-hook 'c++-mode-hook 'c-turn-on-eldoc-mode))

;; (use-package gnuplot)

(provide 'setup-cpp)
