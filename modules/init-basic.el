;;; init-basic.el --- Fixing weird quirks and poor defaults

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


(show-paren-mode 1)

;; (use-package whitespace
;;   :commands whitespace-mode
;;   :config
;;   (modeline-remove-lighter 'whitespace-mode))

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

(defalias 'yes-or-no-p 'y-or-n-p)

(bind-key "C-x p" 'pop-to-mark-command)
(setq set-mark-command-repeat-pop t)

;; Sync Copy/Paste Clipboards with Linux X11
(setq x-select-enable-clipboard t)
(setq x-select-enable-primary t)
(setq save-interprogram-paste-before-kill t
      apropos-do-all t
      mouse-yank-at-point t
      require-final-newline t
      visible-bell t
      load-prefer-newer t
      ediff-window-setup-function 'ediff-setup-windows-plain)

(provide 'init-basic)
;;; init-basic.el ends here
