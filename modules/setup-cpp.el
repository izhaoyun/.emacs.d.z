(use-package cmake-mode
  :mode (("CMakeLists.txt\\'" . cmake-mode)
         ("\\.cmake\\'" . cmake-mode)))

(defun cpp/init-company-c-headers ()
  (use-package company-c-headers
    :init
    (push 'company-c-headers company-backends))
  )
(add-hook 'c-mode-common-hook 'cpp/init-company-c-headers)

;; (defun run-rtags ()
;;   (interactive)
;;   (use-package rtags
;;     :defer t
;;     :commands (rtags-start-process-unless-running)
;;     :init
;;     (add-hook 'c++-mode-common-hook 'rtags-start-process-unless-running)
;;     (rtags-enable-standard-keybindings c-mode-base-map "\C-cr")
;;     :bind
;;     :config
;;     )
;;   )

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
