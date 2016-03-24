;;; init.el
(setq gc-cons-threshold 100000000)

;; personal information
(setq user-full-name "Zhao Yun"
      user-mail-address "zjlyzhy@gmail.com")

;; load path etc.
(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("popkit" . "http://elpa.popkit.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))

(package-initialize)
(setq package-enable-at-startup nil)
(unless package-archive-contents (package-refresh-contents))
(unless (package-installed-p 'use-package) (package-install 'use-package))
(setq use-package-verbose t)
(setq use-package-always-ensure t)
(require 'use-package)

;; load settings for Emacs
(add-to-list 'load-path "~/.emacs.d/modules")
(require 'init-basic)
(require 'init-packages)
;; (require 'init-keys)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'init-cpp)
(require 'init-org)
(require 'init-erlang)
(require 'init-python)
(require 'init-ruby)
(require 'init-latex)

;;; init.el ends here
