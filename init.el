;; personal information
(setq user-full-name "Zhao Yun"
      user-mail-address "zjlyzhy@gmail.com")

;; basic settings
(add-to-list 'load-path "~/.emacs.d/core")
(require 'setup-packages)
(require 'setup-custom)
(require 'setup-utils)

;; modules for programming
(add-to-list 'load-path "~/.emacs.d/modules")
(require 'setup-project)
(require 'setup-completion)

;; langs settings
(add-to-list 'load-path "~/.emacs.d/langs")
(require 'setup-org)

;;; init.el ends here
