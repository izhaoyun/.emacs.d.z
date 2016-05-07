(use-package cl)
(use-package cl-lib)

(use-package dash
  :config
  (dash-enable-font-lock))

(use-package winner
  :init
  (winner-mode))

(use-package server
  :config
  (unless (server-running-p)
    (server-start)))

(use-package expand-region
  :bind
  ("C-=" . er/expand-region))

(use-package rainbow-delimiters
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(use-package window-numbering
  :init
  (window-numbering-mode))

(use-package undo-tree
  ;; :defer 8
  :diminish undo-tree-mode
  :init
  (setq undo-tree-visualizer-diff t)
  (setq undo-tree-visualizer-timestamps t)
  (global-undo-tree-mode))

(use-package swiper
  ;;  :defer 1
  :ensure counsel
  :diminish ivy-mode
  :init
  (setq ivy-use-virtual-buffers t)
  (setq ivy-display-style 'fancy)
  (setq counsel-find-file-at-point t)
  :bind
  (("C-s" . swiper)
   ("C-r" . ivy-resume)
   ("M-x" . counsel-M-x)
   ("M-y" . counsel-yank-pop)
   ("C-x C-f" . counsel-find-file)
   ("C-h K"   . counsel-descbinds)
   ("C-h S"   . counsel-info-lookup-symbol)
   ("C-h l"   . counsel-load-library)
   ("C-c s a" . counsel-ag)
   ("C-c s g" . counsel-git)
   ("C-c s p" . counsel-git-grep)
   ("C-c s l" . counsel-locate))
  :bind
  (:map help-map
        ("f" . counsel-describe-function)
        ("v" . counsel-describe-variable))
  :init
  (ivy-mode))

;; (use-package hydra)

(use-package which-key
  :defer 5
  :diminish which-key-mode
  :init
  (which-key-mode)
  (which-key-setup-side-window-right-bottom))

(use-package avy
  :bind
  (("C-:" . avy-goto-char)
   ("C-'" . avy-goto-char-2)
   ("M-g f" . avy-goto-line)
   ("M-g w" . avy-goto-word-1)
   ("M-g e" . avy-goto-word-0)
   ("M-p" . avy-pop-mark))
  :commands avy-setup-default
  :init
  (avy-setup-default)
  (setq avy-all-windows nil)
  (setq avy-timeout-seconds 0.8)
  (advice-add 'swiper :before 'avy-push-mark))

(use-package ace-pinyin
  :diminish ace-pinyin-mode
  :commands ace-pinyin-global-mode
  :init
  (setq ace-pinyin-use-avy t)
  (ace-pinyin-global-mode))

(use-package ace-link
  :init
  (ace-link-setup-default))

(use-package helm-config
  :ensure helm
  :init
  (setq helm-truncate-lines t)
  (setq helm-move-to-line-cycle-in-source t)
  (setq helm-mode-fuzzy-match t)
  (setq helm-completion-in-region-fuzzy-match t)
  (global-unset-key (kbd "C-x c")))

(provide 'setup-utils)
