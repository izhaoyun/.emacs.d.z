;;; init.el

(setq gc-cons-threshold 100000000)

;; el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/recipes")
(el-get 'sync)
;; el-get setup ends here

(package-initialize nil)
(setq package-enable-at-startup nil)

(unless (package-installed-p 'use-package)
  (el-get-bundle use-package))  
(setq use-package-verbose t)
(require 'use-package)

;; load settings for Emacs
(add-to-list 'load-path "~/.emacs.d/settings")
(require 'init-basic)
;; (require 'init-ido)
;; (require 'init-yasnippet)
(require 'init-helm)
(require 'init-swiper)

;; load modules for different programming languages
(add-to-list 'load-path "~/.emacs.d/langs")
(require 'init-project)
;; (require 'init-company)
;; (require 'init-flycheck)
;; (require 'init-web)
(require 'init-org)
;; (require 'init-cc)
;; (require 'init-python)
;; (require 'init-ruby)

;;; init.el ends here
