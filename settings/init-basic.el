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

;; Package: rainbow-delimiters
(el-get-bundle rainbow-delimiters)
(use-package rainbow-delimiters
  :config
  (add-hook 'org-mode-hook #'rainbow-delimiters-mode)
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

;; Package: smartparens
(el-get-bundle smartparens)
;; https://github.com/sachac/.emacs.d/blob/gh-pages/Sacha.org#smartparens-mode
(use-package smartparens
  :config
  (progn
    (require 'smartparens-config)
    (add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
    (add-hook 'emacs-lisp-mode-hook 'show-smartparens-mode)
;;;;;;;;;;;;;;;;;;;;;;;;
    ;; keybinding management
    (define-key sp-keymap (kbd "C-c s r n") 'sp-narrow-to-sexp)
    (define-key sp-keymap (kbd "C-M-f") 'sp-forward-sexp)
    (define-key sp-keymap (kbd "C-M-b") 'sp-backward-sexp)
    (define-key sp-keymap (kbd "C-M-d") 'sp-down-sexp)
    (define-key sp-keymap (kbd "C-M-a") 'sp-backward-down-sexp)
    (define-key sp-keymap (kbd "C-S-a") 'sp-beginning-of-sexp)
    (define-key sp-keymap (kbd "C-S-d") 'sp-end-of-sexp)
    (define-key sp-keymap (kbd "C-M-e") 'sp-up-sexp)
    (define-key emacs-lisp-mode-map (kbd ")") 'sp-up-sexp)
    (define-key sp-keymap (kbd "C-M-u") 'sp-backward-up-sexp)
    (define-key sp-keymap (kbd "C-M-t") 'sp-transpose-sexp)
    (define-key sp-keymap (kbd "C-M-n") 'sp-next-sexp)
    (define-key sp-keymap (kbd "C-M-p") 'sp-previous-sexp)
    (define-key sp-keymap (kbd "C-M-k") 'sp-kill-sexp)
    (define-key sp-keymap (kbd "C-M-w") 'sp-copy-sexp)
    (define-key sp-keymap (kbd "M-<delete>") 'sp-unwrap-sexp)
    (define-key sp-keymap (kbd "M-<backspace>") 'sp-backward-unwrap-sexp)
    (define-key sp-keymap (kbd "C-<right>") 'sp-forward-slurp-sexp)
    (define-key sp-keymap (kbd "C-<left>") 'sp-forward-barf-sexp)
    (define-key sp-keymap (kbd "C-M-<left>") 'sp-backward-slurp-sexp)
    (define-key sp-keymap (kbd "C-M-<right>") 'sp-backward-barf-sexp)
    (define-key sp-keymap (kbd "M-D") 'sp-splice-sexp)
    (define-key sp-keymap (kbd "C-M-<delete>") 'sp-splice-sexp-killing-forward)
    (define-key sp-keymap (kbd "C-M-<backspace>") 'sp-splice-sexp-killing-backward)
    (define-key sp-keymap (kbd "C-S-<backspace>") 'sp-splice-sexp-killing-around)
    (define-key sp-keymap (kbd "C-]") 'sp-select-next-thing-exchange)
    (define-key sp-keymap (kbd "C-<left_bracket>") 'sp-select-previous-thing)
    (define-key sp-keymap (kbd "C-M-]") 'sp-select-next-thing)
    (define-key sp-keymap (kbd "M-F") 'sp-forward-symbol)
    (define-key sp-keymap (kbd "M-B") 'sp-backward-symbol)
    (define-key sp-keymap (kbd "C-c s t") 'sp-prefix-tag-object)
    (define-key sp-keymap (kbd "C-c s p") 'sp-prefix-pair-object)
    (define-key sp-keymap (kbd "C-c s c") 'sp-convolute-sexp)
    (define-key sp-keymap (kbd "C-c s a") 'sp-absorb-sexp)
    (define-key sp-keymap (kbd "C-c s e") 'sp-emit-sexp)
    (define-key sp-keymap (kbd "C-c s p") 'sp-add-to-previous-sexp)
    (define-key sp-keymap (kbd "C-c s n") 'sp-add-to-next-sexp)
    (define-key sp-keymap (kbd "C-c s j") 'sp-join-sexp)
    (define-key sp-keymap (kbd "C-c s s") 'sp-split-sexp)
;;;;;;;;;;;;;;;;;;
    ;; pair management
    (sp-local-pair 'minibuffer-inactive-mode "'" nil :actions nil)
    (sp-local-pair 'web-mode "<" nil :when '(my/sp-web-mode-is-code-context))))
(show-paren-mode 1)

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
