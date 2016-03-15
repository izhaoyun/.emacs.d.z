;;; init-basic.el --- Fixing weird quirks and poor defaults

;;; Commentary:

;;; Code:
(when window-system
  (tooltip-mode -1)
  (tool-bar-mode -1)
  (menu-bar-mode -1)
  (scroll-bar-mode -1))

(setq inhibit-splash-screen t)
(global-hl-line-mode)                   ; highlight cursor line
(blink-cursor-mode -1)

;; Backups
(setq delete-old-versions -1)
(setq version-control t)
(setq vc-make-backup-files t)
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)))

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

;; Files and sessions
(setq auto-save-timeout 120)
(setq read-file-name-completion-ignore-case t)
(setq tramp-default-method "ssh")

;; UTF-8
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-language-environment   'utf-8)
(set-default-coding-systems 'utf-8)
(prefer-coding-system       'utf-8)

(global-font-lock-mode)
(winner-mode)
(global-linum-mode)
(column-number-mode)

;; Align text
;; http://pragmaticemacs.com/emacs/aligning-text/
(defun bjm/align-whitespace (start end)
  "Align columns by whitespace"
  (interactive "r")
  (align-regexp start end
                "\\(\\s-*\\)\\s-" 1 0 t))

(defun bjm/align-& (start end)
  "Align columns by ampersand"
  (interactive "r")
  (align-regexp start end
                "\\(\\s-*\\)&" 1 1 t))

;; https://www.emacswiki.org/emacs/ZapToChar
;; https://www.emacswiki.org/emacs/ZapToCharUsage
(autoload 'zap-up-to-char "misc"
  "Kill up to, but not including ARGth occurrence of CHAR." t)
(global-set-key (kbd "M-z") 'zap-up-to-char)

(defalias 'yes-or-no-p 'y-or-n-p)

(bind-key "C-x p" 'pop-to-mark-command)
(setq set-mark-command-repeat-pop t)

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
