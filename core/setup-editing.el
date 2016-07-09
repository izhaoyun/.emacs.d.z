(when window-system
  (tool-bar-mode -1)
  (menu-bar-mode -1)
  (scroll-bar-mode -1)
  (blink-cursor-mode -1)
  (setq frame-title-format '(buffer-file-name "%f" ("%b"))))

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
  :diminish whitespace-mode
  :commands (whitespace-mode
             whitespace-cleanup)
  :bind
  (("C-c T w" . whitespace-mode))
  :init
  (add-hook 'before-save-hook 'whitespace-cleanup)
  :config
  (setq whitespace-line-column nil))

(use-package winner
  :commands winner-mode
  :init
  (winner-mode)
  :bind
  (("C-x 4 u" . winner-undo)
   ("C-x 4 r" . winner-redo)
   )
  )

(use-package comment-dwim-2
  :bind
  ("M-;" . comment-dwim-2))

(use-package aggressive-indent
  :diminish aggressive-indent-mode
  :config
  (global-aggressive-indent-mode 1))

(use-package clean-aindent-mode
  :init
  (electric-indent-mode -1)
  (clean-aindent-mode 1)
  (setq clean-aindent-is-simple-indent t))

;; (use-package indent-guide
;;   :diminish indent-guide-mode
;;   :init
;;   (indent-guide-mode 1)
;;   )

(use-package dtrt-indent
  :diminish dtrt-indent-mode
  :init
  (dtrt-indent-mode 1)
  (setq dtrt-indent-verbosity 0)
  )

(use-package abbrev
  :ensure nil
  :diminish abbrev-mode
  :config
  (if (file-exists-p abbrev-file-name)
      (quietly-read-abbrev-file)))

(use-package highlight-symbol
  :bind
  (("C-<f5>" . highlight-symbol)
   ("<f5>"   . highlight-symbol-next)
   ("S-<f5>" . highlight-symbol-prev)
   ("M-<f5>" . highlight-symbol-query-replace))
  )

;; (use-package edit-server
;;   :if window-system
;;   :init
;;   (add-hook 'after-init-hook 'server-start t)
;;   (add-hook 'after-init-hook 'edit-server-start t))

(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "RET") 'newline-and-indent)

(defalias 'yes-or-no-p 'y-or-n-p)

(use-package window-numbering
  :commands (window-numbering-mode)
  :init
  (window-numbering-mode 1)
  )

(use-package recentf
  :commands (recentf-mode)
  :init
  (recentf-mode 1)
  :bind
  ("C-x C-r" . recentf-open-files)
  )

(provide 'setup-editing)
