;;; init.el --- Where all the magic begins

(setq dotfiles-dir (file-name-directory (or (buffer-file-name) 
                                         load-file-name)))

(let* ((org-dir "~/.emacs.d/site-lisp/org-mode/lisp")
       (org-contrib-dir "~/.emacs.d/site-lisp/org-mode/contrib/lisp")
       (load-path (append (list org-dir org-contrib-dir)
			  (or load-path nil))))
  ;; load up Org-mode and Org-babel
  (require 'org-install)
  (require 'ob-tangle))

;;;; load up all literate org-mode files in this directory
(mapc #'org-babel-load-file (directory-files dotfiles-dir t "\\.org$"))

;;; init.el ends here
