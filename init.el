(package-initialize)
(mapc #'(lambda (path)
	  (add-to-list 'load-path
		       (expand-file-name path user-emacs-directory)))
      '("site-lisp" "lisp" "lib/use-package"))

(require 'cl)

(defvar use-package-verbose t)
(require 'use-package)

(use-package avy
  :load-path "site-lisp/avy"
  :bind
  (("C-:" . avy-goto-char)
   ("M-p" . avy-pop-mark))
  :config
  (avy-setup-default))

(use-package which-key
  :load-path "site-lisp/which-key"
  :init
  (which-key-mode))

(use-package python-mode
  :load-path "site-lisp/python-mode"
  :config
  )
