
(setq sentence-end
      "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
(setq sentence-end-double-space nil)





(defun init-org-bullets ()
  (use-package org-bullets
    :load-path "site-lisp/org-mode/contrib/lisp"
    :init
    (org-bullets-mode 1))
  )

(defun init-org-publish ()
  (use-package ox-publish
    :ensure org
    :init
    (setq org-publish-project-alist
          '("org-notes"
            :base-directory "~/org-notes/"
            :base-extension "org"
            :publishing-directory "~/public_html/"
            :recursive t
            :publishing-function org-html-publish-to-html
            :auto-preamble t
            ))
    )
  )

(use-package org
  :mode (("\\.org$" . org-mode)
         ("\\.txt$" . org-mode))
  :bind
  (("C-c a" . org-agenda)
   ("C-c b" . org-iswitchb)
   ("C-c c" . org-capture)
   ("C-c l" . org-store-link))
  :init
  (setq org-src-fontify-natively t)
  o

  :config
  ;; alist of packages to be inserted in every LaTeX header.

;;(use-package calfw
;;  :config
;;  (use-package calfw-org
;;    :ensure calfw)
;;  )

(provide 'setup-org)
