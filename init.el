;; packages repositories
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(package-initialize)
(setq package-enable-at-startup nil)

;; install use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(setq use-package-verbose t)
(setq use-package-always-ensure t)
(eval-when-compile
  (require 'use-package))
(require 'diminish)
(require 'bind-key)

(setq load-prefer-newer t)

(use-package auto-compile
  :init
  (setq auto-compile-display-buffer nil)
  (auto-compile-on-save-mode)
  (auto-compile-on-load-mode))

(use-package async-bytecomp
  :ensure async
  :init
  (async-bytecomp-package-mode 1))

;; basic settings
(add-to-list 'load-path "~/.emacs.d/core")
(require 'setup-custom)
(require 'setup-utils)

;; modules for programming
(add-to-list 'load-path "~/.emacs.d/modules")
;;(require 'setup-completion)
;;(require 'setup-vc)
;;(require 'setup-project)

;; langs settings
(add-to-list 'load-path "~/.emacs.d/langs")
;;(require 'setup-org)

;;; init.el ends here
