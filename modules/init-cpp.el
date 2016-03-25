(use-package cc-mode
  :mode (("\\.h$" . c++-mode)))

(use-package company-c-headers
  :init)

(use-package cmake-mode
  :pin marmalade
  :mode (("CMakeLists\\.txt\\'" . cmake-mode)
         ("\\.cmake\\'"         . cmake-mode)))

(use-package gdb-mi
  :defer t
  :init (setq gdb-many-windows t
              gdb-show-main    t))

(use-package company-c-headers
  :config
  (add-to-list 'company-backends 'company-c-headers))

(use-package helm-gtags
  :defer 6
  :init
  (setq helm-gtags-ignore-case t)
  (setq helm-gtags-auto-update t)
  (setq helm-gtags-use-input-at-cursor t)
  (setq helm-gtags-pulse-at-cursor     t)
  (setq helm-gtags-suggested-key-mapping t)
  (setq helm-gtags-prefix-key "\M-sg")
  (add-hook 'c-mode-hook 'helm-gtags-mode)
  (add-hook 'c++-mode-hook 'helm-gtags-mode)
  (add-hook 'asm-mode-hook 'helm-gtags-mode)
  :config
  (define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
  (define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
  (define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
  (define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history))

(use-package cedet
  :defer 6
  :pin manual
  :init
  (load-file "~/.emacs.d/src/cedet/cedet-devel-load.el")
  (load-file "~/.emacs.d/src/cedet/contrib/cedet-contrib-load.el")
  (require 'semantic))

(use-package stickyfunc-enhance
  :defer 7
  :config
  (add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)
  (semantic-mode))

(provide 'init-cpp)
;;; init-cpp.el ends here
