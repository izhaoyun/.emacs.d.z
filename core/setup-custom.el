;; general userinterface and appearance
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-startup-message t)
(setq visible-bell t)
(global-font-lock-mode 1)
(global-hl-line-mode t)

;; cursor and mouse
(blink-cursor-mode -1)
(setq track-eol nil)
(setq mouse-yank-at-point t)
(setq scroll-preserve-screen-position t)
(mouse-avoidance-mode 'jump)
(set-cursor-color "black")
(column-number-mode t)
(mouse-wheel-mode t)

;; customization for your locale, environment and computer.
;; (setq european-calendar-style 't)
;; (setq calendar-week-start-day 1)
;; (setq ps-paper-type 'a4)
;; (setq ispell-dictionary "english")
;; (setq shell-file-name "/bin/bash")
;; (setq tex-shell-file-name "/bin/bash")
;; (setq grep-command "grep -i -nH -e ")
;; (setq exec-path (append exec-path '("/bin")))

;; files and sessions
(setq auto-save-timeout 90)
(setq make-backup-files nil)
(setq read-file-name-completion-ignore-case 't)

;; tabs, spaces, lines and parenthesis
(setq-default indent-tabs-mode nil)
(setq tab-width 4)
(setq sentence-end-double-space nil)
(setq truncate-partial-width-windows nil)
(setq-default indicate-empty-lines t)
(setq next-line-add-newlines t)
(setq require-final-newline 't)
(global-linum-mode 1)
(show-paren-mode 1)
(setq blink-matching-paren-distance nil)
(setq show-paren-style 'expression)

;; buffers and windows
(setq frame-title-format "%b - emacs")
;; (global-set-key (kbd "C-x C-b") 'ibuffer)
;; (icomplete-mode t)
(setq read-buffer-completion-ignore-case 't)

;; key bindings
(global-unset-key "\C-x\C-v")
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "RET") 'newline-and-indent)

;; backups
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq delete-old-versions -1)
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

;; miscellaneous
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(defalias 'yes-or-no-p 'y-or-n-p)
(setq gc-cons-threshold 100000000)

(provide 'setup-custom)


