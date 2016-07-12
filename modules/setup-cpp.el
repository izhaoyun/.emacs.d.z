(use-package cmake-mode
  :mode (("CMakeLists.txt\\'" . cmake-mode)
         ("\\.cmake\\'" . cmake-mode))
  )

(use-package ggtags
  :init
  (add-hook 'c-mode-common-hook
            (lambda ()
              (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
                (ggtags-mode 1))))
  :bind
  (:map ggtags-mode-map
        ("C-c g s" . ggtags-find-other-symbol)
        ("C-c g d" . ggtags-find-definition)
        ("C-c g h" . ggtags-view-tag-history)
        ("C-c g r" . ggtags-find-reference)
        ("C-c g f" . ggtags-find-file)
        ("C-c g c" . ggtags-create-tags)
        ("C-c g u" . ggtags-update-tags)
        ("M-," . pop-tag-mark)
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

;; (use-package semantic
;; :init
;; (add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)
;; )

(defun cpp/init-gdb ()
  (use-package gdb-mi
    :config
    (setq gdb-many-windows t)
    (setq gdb-show-main t)
    )
  )
(add-hook 'c-mode-common-hook 'cpp/init-gdb)

(defun cpp/init-rtags ()
  (use-package rtags
    :commands rtags-enable-standard-keybindings
    :init
    (rtags-enable-standard-keybindings)
    :config
    (add-hook 'c-mode-common-hook 'rtags-start-process-unless-running)
    (add-hook 'c++-mode-common-hook 'rtags-start-process-unless-running)
    )
  )
(add-hook 'c-mode-common-hook 'cpp/init-rtags)
(add-hook 'c++-mode-common-hook 'cpp/init-rtags)


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
