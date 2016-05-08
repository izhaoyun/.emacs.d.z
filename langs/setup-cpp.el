(use-package cc-mode
  :mode (("\\.h$" . c++-mode))
  :config
  (add-hook 'c++-mode-hook
            (lambda ()
              (hs-minor-mode)
              )
            )
  )

;;(use-package cmake-mode
;;  :mode (("CMakeLists\\.txt\\'" . cmake-mode)
;;         ("\\.cmake\\'"         . cmake-mode)))

(use-package gdb-mi
  :init
  (setq gdb-many-windows t)
  (setq gdb-show-main    t)
  )

;; (use-package company-c-headers
;;   :defer 8
;;   :config
;;   (add-to-list 'company-backends 'company-c-headers))

;; (use-package helm-gtags
;;   :defer 6
;;   :init
;;   (setq helm-gtags-ignore-case t)
;;   (setq helm-gtags-auto-update t)
;;   (setq helm-gtags-use-input-at-cursor t)
;;   (setq helm-gtags-pulse-at-cursor     t)
;;   (setq helm-gtags-suggested-key-mapping t)
;;   (setq helm-gtags-prefix-key "\M-sg")
;;   (add-hook 'c-mode-hook 'helm-gtags-mode)
;;   (add-hook 'c++-mode-hook 'helm-gtags-mode)
;;   (add-hook 'asm-mode-hook 'helm-gtags-mode)
;;   :config
;;   (define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
;;   (define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
;;   (define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
;;   (define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history))

(provide 'setup-cpp)
