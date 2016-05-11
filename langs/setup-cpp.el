(use-package cc-mode
  :mode (("\\.h\\'" . c++-mode))
  :bind
  ("RET" . newline-and-indent)
  :init
  (setq c-default-style "linux")
  (setq-default indent-tabs-mode nil)
  (setq-default tab-width 4)
  (add-hook 'c-mode-common-hook 'hs-minor-mode)
  (add-hook 'c-mode-common-hook 'init-company)
  (add-hook 'c-mode-common-hook 'init-semantic-stickyfunc-enhance))

;; (use-package company-c-headers
;;   :defer 8
;;   :config
;;   (add-to-list 'company-backends 'company-c-headers))

(use-package helm-gtags
  :defer t
  :init
  (setq helm-gtags-ignore-case t)
  (setq helm-gtags-auto-update t)
  (setq helm-gtags-use-input-at-cursor t)
  (setq helm-gtags-pulse-at-cursor     t)
  (setq helm-gtags-suggested-key-mapping t)
  (setq helm-gtags-prefix-key "\C-cg")
  :bind
  ("C-c g a" . helm-gtags-tags-in-this-function)
  ("C-j" . helm-gtags-select)
  ("M-." . helm-gtags-dwim)
  ("M-," . helm-gtags-pop-stack)
  ("C-c <" . helm-gtags-previous-history)
  ("C-c >" . helm-gtags-next-history)
  :config
  (add-hook 'dired-mode-hook 'helm-gtags-mode)
  (add-hook 'eshell-mode-hook 'helm-gtags-mode)
  (add-hook 'c-mode-hook 'helm-gtags-mode)
  (add-hook 'c++-mode-hook 'helm-gtags-mode)
  (add-hook 'asm-mode-hook 'helm-gtags-mode))

(provide 'setup-cpp)
