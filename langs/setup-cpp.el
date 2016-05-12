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

(use-package company-c-headers
  :config
  (eval-after-load 'company
    '(push 'company-c-headers company-backends)
    ))

(use-package ggtags
  :bind
  (:map ggtags-mode-map
        ("C-c g s" . ggtags-find-other-symbol)
        ("C-c g h" . ggtags-view-tag-history)
        ("C-c g r" . ggtags-find-reference)
        ("C-c g f" . ggtags-find-file)
        ("C-c g c" . ggtags-create-tags)
        ("C-c g u" . ggtags-update-tags)
        ("C-,"     . pop-tag-mark))
  :init
  (ggtags-mode 1)
  (setq-local imenu-create-index-function #'ggtags-build-imenu-index)
  (setq-local eldoc-documentation-function #'ggtags-eldoc-function)
  (add-hook 'c-mode-common-hook
            (lambda ()
              (when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'asm-mode)
                (ggtags-mode 1)))))

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
