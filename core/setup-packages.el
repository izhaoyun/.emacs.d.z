(require 'package)

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
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

;; (use-package paradox
;;   :commands paradox-list-packages
;;   :init
;;   (setq paradox-automatically-star nil)
;;   (setq paradox-execute-asynchronously nil))

(provide 'setup-packages)
