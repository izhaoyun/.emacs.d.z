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

(defun install-pkgs (pkgs-list)
  "Install all require packages."
  (unless package-archive-contents
    (package-refresh-contents))
  (dolist (package pkgs-list)
    (unless (package-installed-p package)
      (package-install package)))
  )

(defun my/byte-recompile ()
  (interactive)
  (byte-recompile-directory "~/.emacs.d" 0)
  )

(add-to-list 'load-path "~/.emacs.d/core")
(require 'setup-editing)
(require 'setup-utils)
(require 'setup-develop)

;; langs settings
(add-to-list 'load-path "~/.emacs.d/modules")
(require 'setup-org)
(require 'setup-cpp)
(require 'setup-shell)
;; (require 'setup-ruby)
(require 'setup-python)
(require 'setup-go)
(require 'setup-erlang)

;; ;;; init.el ends here
