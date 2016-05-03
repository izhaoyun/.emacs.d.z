;; basic settings
(add-to-list 'load-path "~/.emacs.d/core")
(require 'setup-packages)
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
