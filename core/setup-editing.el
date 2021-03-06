(when window-system
  (tool-bar-mode -1)
  (menu-bar-mode -1)
  (scroll-bar-mode -1)
  (blink-cursor-mode -1)
  (setq frame-title-format '(buffer-file-name "%f" ("%b"))))

(setq visible-bell t
      inhibit-startup-message t
      sentence-end-double-space nil)

;; (global-hl-line-mode 1)
(global-font-lock-mode 1)
(global-linum-mode 1)
(column-number-mode 1)

(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; backups
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq delete-old-versions t)
(setq version-control t)
(setq vc-make-backup-files t)
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)))

;; history
(setq savehist-file "~/.emacs.d/savehist")
(savehist-mode 1)
(setq history-length t)
(setq history-delete-duplicates t)
(setq savehist-save-minibuffer-history 1)
(setq savehist-additional-variables
      '(kill-ring
        search-ring
        regexp-search-ring))

(use-package paren
  :init
  (show-paren-mode 1)
  :config
  (setq show-paren-style 'expression)
  )

(use-package rainbow-delimiters
  :commands (rainbow-delimiters-mode)
  :init
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
  )

(use-package elec-pair
  :ensure nil
  :init
  (electric-pair-mode 1)
  :config
  (setq electric-pair-pairs '((?\" . ?\")
                              (?\{ . ?\})))
  )

(use-package expand-region
  :commands (er/expand-region
             er/contract-region)
  :bind
  (("C-=" . er/expand-region)
   ("C--" . er/contract-region))
  )

(use-package undo-tree
  :diminish undo-tree-mode
  :commands (global-undo-tree-mode)
  :bind
  (("C-z" . undo)
   ("C-S-z" . undo-tree-redo))
  :init
  (global-undo-tree-mode)
  :config
  (setq undo-tree-visualizer-diff t)
  (setq undo-tree-visualizer-timestamps t)
  )

(use-package whitespace
  :diminish whitespace-mode
  :commands (whitespace-mode
             whitespace-cleanup)
  :bind
  (("C-c T w" . whitespace-mode))
  :init
  (add-hook 'before-save-hook 'whitespace-cleanup)
  :config
  (setq whitespace-line-column nil)
  )

(use-package winner
  :commands (winner-mode
             winner-undo
             winner-redo)
  :init
  (winner-mode)
  :bind
  (("C-x 4 u" . winner-undo)
   ("C-x 4 r" . winner-redo)
   )
  )

(use-package comment-dwim-2
  :bind
  ("M-;" . comment-dwim-2)
  )

(use-package aggressive-indent
  :diminish aggressive-indent-mode
  :init
  (add-hook 'prog-mode-hook #'aggressive-indent-mode)
  )

(use-package clean-aindent-mode
  :commands (clean-aindent-mode)
  :init
  (electric-indent-mode -1)
  (clean-aindent-mode 1)
  :config
  (setq clean-aindent-is-simple-indent t)
  )

(use-package dtrt-indent
  :diminish dtrt-indent-mode
  :init
  (dtrt-indent-mode 1)
  :config
  (setq dtrt-indent-verbosity 0)
  )

(use-package highlight-symbol
  :bind
  (("C-<f5>" . highlight-symbol)
   ("<f5>"   . highlight-symbol-next)
   ("S-<f5>" . highlight-symbol-prev)
   ("M-<f5>" . highlight-symbol-query-replace))
  )

(use-package hippie-exp
  :commands (hippie-expand)
  :bind
  ("M-/" . hippie-expand)
  )

(global-set-key (kbd "RET") 'newline-and-indent)

(defalias 'yes-or-no-p 'y-or-n-p)

(use-package window-numbering
  :commands (window-numbering-mode)
  :init
  (window-numbering-mode 1)
  )

(use-package recentf
  :commands (recentf-mode
             recentf-open-files)
  :bind
  (("C-x C-r" . recentf-open-files))
  :init
  (recentf-mode 1)
  )

(provide 'setup-editing)
