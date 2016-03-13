;;; init-basic.el --- Fixing weird quirks and poor defaults

;;; Commentary:

;;; Code:
(setq inhibit-splash-screen t)
(when window-system
  (tooltip-mode -1)
  (tool-bar-mode -1)
  (menu-bar-mode 1)
  (scroll-bar-mode -1))

;; Backups
(setq delete-old-versions -1)
(setq version-control t)
(setq vc-make-backup-files t)
(setq backup-directory-alist
      '(("." . "~/.emacs.d/backups")))
(setq auto-save-file-name-transforms
      '((".*" "~/.emacs.d/auto-save-list/" t)))

;; History
(setq savehist-file "~/.emacs.d/savehist")
(savehist-mode 1)
(setq history-length t)
(setq history-delete-duplicates t)
(setq savehist-save-minibuffer-history 1)
(setq savehist-additional-variables
      '(kill-ring
	search-ring
	regexp-search-ring))

;; UTF-8
(prefer-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-language-environment   'utf-8)
(set-default-coding-systems 'utf-8)
(prefer-coding-system       'utf-8)

(global-font-lock-mode)
(winner-mode)
(global-linum-mode)
(column-number-mode)

;; Package: undo-tree
(el-get-bundle undo-tree)
(use-package undo-tree
  :defer t
  :ensure t
  :diminish undo-tree-mode
  :config
  (progn
    (global-undo-tree-mode)
    (setq undo-tree-visualizer-timestamps t)
    (setq undo-tree-visualizer-diff       t)))

;; Package: expand-region
(el-get-bundle expand-region)
(use-package expand-region
  :bind ("C-=" . er/expand-region))

;; Package: guide-key
(el-get-bundle guide-key)
(use-package guide-key
  :defer t
  :diminish guide-key-mode
  :config
  (progn
    (setq guide-key/guide-key-sequence '("C-x r" "C-x 4" "C-c"))
    (guide-key-mode 1)))  ; Enable guide-key-mode

;; Package: window-numbering 
(el-get-bundle window-numbering)
(use-package window-numbering
  :config
  (window-numbering-mode))

;; Package: smart-mode-line
(el-get-bundle smart-mode-line)
(use-package smart-mode-line
  :init
  (progn
    (setq sml/them 'light)
    (setq sml/no-confirm-load-theme t)
    (sml/setup)))

;; https://www.emacswiki.org/emacs/ZapToChar
;; https://www.emacswiki.org/emacs/ZapToCharUsage
(autoload 'zap-up-to-char "misc"
  "Kill up to, but not including ARGth occurrence of CHAR." t)
(global-set-key (kbd "M-z") 'zap-up-to-char)

(defalias 'yes-or-no-p 'y-or-n-p)

(bind-key "C-x p" 'pop-to-mark-command)
(setq set-mark-command-repeat-pop t)

;; remote server files
(setq tramp-default-method "ssh")

(show-paren-mode 1)
(setq-default indent-tabs-mode nil)
(setq tab-width 4)
(setq x-select-enable-clipboard t
      x-select-enable-primary t
      save-interprogram-paste-before-kill t
      apropos-do-all t
      mouse-yank-at-point t
      require-final-newline t
      visible-bell t
      load-prefer-newer t
      ediff-window-setup-function 'ediff-setup-windows-plain)

(global-set-key (kbd "M-/") 'hippie-expand)

(provide 'init-basic)
;;; init-basic.el ends here
