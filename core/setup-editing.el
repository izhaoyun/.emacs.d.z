(when window-system
  (tool-bar-mode -1)
  (menu-bar-mode -1)
  (scroll-bar-mode -1)
  (blink-cursor-mode -1)
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  )

(setq visible-bell t
      inhibit-startup-message t
      sentence-end-double-space nil)

(global-hl-line-mode 1)
(global-font-lock-mode 1)
(global-linum-mode 1)
(column-number-mode 1)

(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(use-package paren
  :config
  (setq show-paren-style 'expression)
  (show-paren-mode 1))

(use-package rainbow-delimiters
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(use-package elec-pair
  :ensure nil
  :init
  (setq electric-pair-pairs '((?\" . ?\")
			      (?\{ . ?\})))
  (electric-pair-mode 1))

(use-package expand-region
  :bind
  (("C-=" . er/expand-region)
   ("C--" . er/contract-region)))

(use-package undo-tree
  :diminish undo-tree-mode
  :commands global-undo-tree-mode
  :bind
  ("C-z" . undo)
  :init
  (setq undo-tree-visualizer-diff t)
  (setq undo-tree-visualizer-timestamps t)
  (global-undo-tree-mode))

(use-package whitespace
  :commands whitespace-mode
  :config
  (add-hook 'prog-mode-hook #'whitespace-mode))

(use-package winner
  :commands winner-mode
  :init
  (winner-mode))

(defalias 'yes-or-no-p 'y-or-n-p)

(provide 'setup-editing)
