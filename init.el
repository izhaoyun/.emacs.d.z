(setq gc-cons-threshold 104857600)

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)
(setq package-enable-at-startup nil)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-verbose t)
(setq use-package-always-ensure t)

(setq load-prefer-newer t)

(use-package auto-compile
  :init
  (setq auto-compile-display-buffer nil)
  (setq auto-compile-mode-line-counter t)
  :config
  (auto-compile-on-load-mode)
  (auto-compile-on-save-mode))

(defun install-pkgs (pkgs-list)
  "Install all require packages."
  (unless package-archive-contents
    (package-refresh-contents))
  (dolist (package pkgs-list)
    (unless (package-installed-p package)
      (package-install package)))
  )

;; (global-unset-key "\C-x\C-v")
;; (global-set-key (kbd "M-/") 'hippie-expand)

;; (use-package peep-dired
;;   :defer 9
;;   :commands peep-dired
;;   :bind
;;   (:map dired-mode-map
;;         ("P" . peep-dired)
;;         ("n" . peep-dired-next-file)
;;         ("p" . peep-dired-prev-file)
;;         ("K" . peep-dired-kill-buffers-without-window)
;;         ("C-n" . dired-next-line)
;;         ("C-p" . dired-previous-line))
;;   :init
;;   (setq peep-dired-enable-on-directories t))

;; (setq backup-directory-alist '(("-autoloads.el\\'")
;;                                ("-loaddefs.el\\'")
;;                                ("." . "~/.emacs.d/backups")))

;; (setq delete-old-versions -1)
;; (setq version-control t)
;; (setq auto-save-file-name-transforms
;;       '((".*" "~/.emacs.d/auto-save-list/" t)))

;; (use-package savehist
;;   :init
;;   (savehist-mode 1)
;;   (setq savehist-file "~/.emacs.d/savehist")
;;   (setq savehist-additional-variables
;;         '(kill-ring search-ring regexp-search-ring)))


;; (use-package window-numbering
;;   :defer 10
;;   :config
;;   (window-numbering-mode))

;; ;; editing
;; (use-package annotate
;;   :commands annotate-mode
;;   :init
;;   (setq annotate-file "~/.emacs.d/annotations"))

(add-to-list 'load-path "~/.emacs.d/core")
(require 'setup-editing)
(require 'setup-utils)
;; ;; (require 'setup-develop)

;; ;; langs settings
(add-to-list 'load-path "~/.emacs.d/langs")
(require 'setup-org)
;; ;; (require 'setup-cpp)
;; ;; (require 'setup-ruby)
;; ;; (require 'setup-python)
;; ;; (require 'setup-go)

;; ;;; init.el ends here
