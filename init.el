;;; init.el

(setq gc-cons-threshold 100000000)

;; load path etc.
(setq package-archives
      '(("gnu"         . "http://elpa.gnu.org/packages/")
        ("org"         . "http://orgmode.org/elpa/")
        ("melpa"       . "http://melpa.org/packages/")
        ("marmalade"   . "http://marmalade-repo.org/packages/")))
;; (package-refresh-contents)
(package-initialize nil)
(setq package-enable-at-startup nil)

(let ((elisp-dir (expand-file-name "src" user-emacs-directory)))
  (add-to-list 'load-path elisp-dir)
  (when (file-exists-p elisp-dir)
    (let ((default-directory elisp-dir))
      (normal-top-level-add-subdirs-to-load-path))))
(setq autoload-file (concat user-emacs-directory "loaddefs.el"))
(setq package-user-dir (concat user-emacs-directory "elpa"))
(setq custom-file (concat user-emacs-directory "custom.el"))

(require 'server)
(unless (server-running-p) (server-start))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(setq use-package-verbose t)
(require 'use-package)

;; load settings for Emacs
(add-to-list 'load-path "~/.emacs.d/settings")
(require 'init-basic)
(require 'init-packages)
;; (require 'init-keys)

;; load modules for different programming languages
(add-to-list 'load-path "~/.emacs.d/langs")
;; (require 'init-company)
;; (require 'init-flycheck)
;; (require 'init-web)
;; (require 'init-org)
;; (require 'init-cc)
;; (require 'init-python)
;; (require 'init-ruby)

;;; init.el ends here
