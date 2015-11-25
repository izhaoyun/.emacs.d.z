(setq inhibit-splash-screen t)

;; coding: utf-8
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; remove visual cruft
(when window-system
  (tooltip-mode -1)
  (tool-bar-mode -1))
;; no menu bar
(menu-bar-mode -1)

;; line number
(global-linum-mode t)
;; show current line and column
(line-number-mode t)
(column-number-mode t)

;; winner-mode
(winner-mode t)

;; Package: window-numbering
(el-get-bundle window-numbering)
(require 'window-numbering)
(window-numbering-mode 1)

;; Package: smart-mode-line
(el-get-bundle smart-mode-line)
(sml/setup)

(provide 'init-window)
