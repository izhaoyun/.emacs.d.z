;;; init-basic.el --- Fixing weird quirks and poor defaults

;;; Commentary:

;;; Code:

;;;###autoload
(progn
  (setq inhibit-splash-screen t)
  (menu-bar-mode -1)
  (when window-system
    (tool-bar-mode -1)
    (scroll-bar-mode -1))

  ;; coding: utf-8
  (set-terminal-coding-system 'utf-8)
  (set-keyboard-coding-system 'utf-8)
  (set-language-environment   'utf-8)
  (set-default-coding-systems 'utf-8)
  (prefer-coding-system       'utf-8)

  (global-font-lock-mode t)
  (global-hl-line-mode t)

  (global-linum-mode t)
  (column-number-mode t)

  ;; history
  (setq savehist-file "~/.emacs.d/savehist")
  (savehist-mode 1)
  (setq history-length t)
  (setq history-delete-duplicates t)
  (setq savehist-save-minibuffer-history 1)
  (setq savehist-additional-variables '(kill-ring
                                        search-ring
                                        regexp-search-ring))

  (winner-mode t)

  ;; Package: window-numbering
  (el-get-bundle window-numbering)
  (require 'window-numbering)
  (window-numbering-mode t)

  ;; Package: smart-mode-line
  (el-get-bundle smart-mode-line)
  (setq sml/them 'light)
  (setq sml/no-confirm-load-theme t)
  (sml/setup)

  (autoload 'zap-up-to-char "misc"
    "Kill up to, but not including ARGth occurrence of CHAR." t)

  (require 'uniquify)
  (setq uniquify-buffer-name-style 'forward)

  (global-set-key (kbd "M-/") 'hippie-expand)

  ;; Package: expand-region
  (el-get-bundle expand-region)
  (require 'expand-region)
  (global-set-key (kbd "C-=") 'er/expand-region)

  (global-set-key (kbd "M-z") 'zap-up-to-char)

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

  (require 'saveplace)
  (setq-default save-place t)

  ;; backup files
  (setq vc-make-version-backup t
  		version-control t
        kept-new-versions 10
        kept-old-versions 0
        delete-old-versions t
        backup-by-copying t)
  (setq backup-directory-alist '(("" . "~/.emacs.d/backups/per-save")))

  (defun force-backup-of-buffer ()
    ;; Make a special "per session" backup at the first save of each
    ;; emacs session.
    (when (not buffer-backed-up)
      ;; Override the default parameters for per-session backups.
      (let ((backup-directory-alist
             '(("" . "~/.emacs.d/backups/per-session")))
            (kept-new-versions 3))
        (backup-buffer)))
    ;; Make a "per save" backup on each save. The first save results in
    ;; both a per-session and a per-save backup, to keep the numbering
    ;; of per-save backups consistent.
    (let ((buffer-backed-up nil))
      (backup-buffer)))

  (add-hook 'before-save-hook 'force-backup-of-buffer)

  ;; cursor and mouse
  ;; (blink-cursor-mode -1)
  (mouse-avoidance-mode 'jump)

  ;; Package: undo-tree
  (el-get-bundle elpa:undo-tree)
  (require 'undo-tree)
  (global-undo-tree-mode 1)
  (setq undo-tree-visualizer-timestamps t
        undo-tree-visualizer-diff       t)
  ;; setting up undo/redo keys
  (defalias 'redo 'undo-tree-redo)
  (global-set-key (kbd "C-z") 'undo)

  ;; Package: multiple-cursors
  (el-get-bundle multiple-cursors)
  (require 'multiple-cursors)
  (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
  (global-set-key (kbd "C->") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
  (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

  ;; remote server files
  (setq tramp-default-method "ssh")

  ;; miscellaneous
  (defalias 'yes-or-no-p 'y-or-n-p)
  (require 'cl))

(provide 'init-basic)
;;; init-basic.el ends here
