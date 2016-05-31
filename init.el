(setq gc-cons-threshold 104857600)

(require 'package)
(setq package-archives '(("gnu"   . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")
                         ("org"   . "http://orgmode.org/elpa/")))
(package-initialize)
(setq package-enable-at-startup nil)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
(setq use-package-always-ensure t)
(require 'diminish)
(require 'bind-key)

(setq load-prefer-newer t)

(use-package auto-compile
  :init
  (setq auto-compile-display-buffer nil)
  (setq auto-compile-mode-line-counter t)
  :config
  (auto-compile-on-load-mode)
  (auto-compile-on-save-mode))

(use-package async
  :config
  (use-package async-bytecomp
    :ensure async
    :config
    (async-bytecomp-package-mode 1)))

(defun install-pkgs (pkgs-list)
  "Install all require packages."
  (unless package-archive-contents
    (package-refresh-contents))
  (dolist (package pkgs-list)
    (unless (package-installed-p package)
      (package-install package)))
  )

(add-to-list 'load-path "~/.emacs.d/core")
(require 'setup-editing)
(require 'setup-utils)
(require 'setup-develop)

;; langs settings
(add-to-list 'load-path "~/.emacs.d/modules")
(require 'setup-org)
(require 'setup-cpp)
;; (require 'setup-ruby)
(require 'setup-python)
;; (require 'setup-go)

;; ;;; init.el ends here
