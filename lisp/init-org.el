;;; Package: org-mode
(el-get-bundle org-mode)

(add-to-list 'auto-mode-alist '("\\.org'" . org-mode))

;; suggested bindings
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

;; turn on font-lock in org buffer
(add-hook 'org-mode-hook 'turn-on-font-lock)

;; code blocks
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (python     . t)
   (sh         . t)
   (org        . t)
   (ruby       . t)
   (latex      . t)
   (ditaa      . t)
   (sql        . t)
   (C          . t)))

(setq org-confirm-babel-evaluate nil)

;; org latex listings
(require 'ox-latex)
(add-to-list 'org-latex-packages-alist '("" "ctex"))
(add-to-list 'org-latex-packages-alist '("" "listings"))
(add-to-list 'org-latex-packages-alist '("" "color"))
(add-to-list 'org-latex-packages-alist '("" "geometry"))
(add-to-list 'org-latex-packages-alist '("dvipsnames" "xcolor"))
(add-to-list 'org-latex-packages-alist '("" "minted"))

;;(setq org-latex-listings t)

;; (setq org-latex-listings-options
;;       '(("basicstyle"          "\\ttfamily")
;;         ("breaklines"          "true")
;;         ("keywordstyle"        "{\\bfseries\\color{NavyBlue}}")
;;         ("commentstyle"        "{\\sffamily\\color{PineGreen!60!black}}")
;;         ;; ("emph"                "{}")
;;         ("emphstyle"           "{\\bfseries\\color{Rhodamine}}")
;;         ;; ("alsoletter"          "{.}")
;;         ("stringstyle"         "{\\rmfamily}")
;;         ("tabsize"             "2")
;;         ("breakatwhitespace"   "true")
;;         ("showspaces"          "false")
;;         ("showstringspaces"    "false")
;;         ("frame"               "single")
;;         ("backgroundcolor"     "{\\color{yellow!20!white}}")
;;         ;; ("numbers"             "left")
;;         ("numberstyle"         "{\\sffamily\\footnotesize}")
;;         ("rulecolor"           "\\color{purple}")
;;         ))

;; on archlinux, you should install pygmentize besides from
;; python-pygments.
(setq org-latex-listings 'minted)

;; for more options of minted package, you can refer to the official docs:
;; http://ctan.mirrorcatalogs.com/macros/latex/contrib/minted/minted.pdf
(setq org-latex-minted-options
      '(("frame"               "single")
        ;; ("linenos"             "")
        ("breaklines"          "")))

(setq org-latex-pdf-process
      '("xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

;; code block fontification
(setq org-src-fontify-natively  t
      org-src-tab-acts-natively t)

;; latex compiler
(setq org-latex-compiler "xelatex")

(setcdr (assoc "\\.pdf\\'" org-file-apps) "evince %s")

;; TODO extensions
(setq org-todo-keywords
      '((sequence "TODO(t)" "|" "DONE(d)")
        (sequence "REPORT(r)" "BUG(b)" "KNOWNCAUSE(k)" "|" "FIXED(f)")
        (sequence "|" "CANCELED(c)")))

(setq org-log-done 'note)

(provide 'init-org)
