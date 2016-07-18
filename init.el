(package-initialize)
(mapc #'(lambda (path)
	  (add-to-list 'load-path
		       (expand-file-name path user-emacs-directory)))
      '("site-lisp" "lisp" "lib/use-package"))

(require 'cl)

(defvar use-package-verbose t)
(require 'use-package)

(require 'bind-key)
(use-package diminish :load-path "site-lisp/diminish")

(use-package avy
  :load-path "site-lisp/avy"
  :commands (avy-setup-default)
  :bind (("C-:" . avy-goto-char)
	 ("M-p" . avy-pop-mark))
  :init
  (avy-setup-default))

(use-package which-key
  :load-path "site-lisp/which-key"
  :commands (which-key-mode
	     which-key-setup-side-window-right-bottom)
  :init
  (which-key-mode)
  (which-key-setup-side-window-right-bottom))

(use-package python-mode
  :load-path "site-lisp/python-mode"
  :config
  )

