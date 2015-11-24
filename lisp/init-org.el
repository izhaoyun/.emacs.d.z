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
   (sql        . t)
   (C          . t)))

(setq org-confirm-babel-evaluate nil)

;; org latex listings
(require 'ox-latex)
(add-to-list 'org-latex-packages-alist '("" "ctex"))
(add-to-list 'org-latex-packages-alist '("" "listings"))
(add-to-list 'org-latex-packages-alist '("" "color"))
(add-to-list 'org-latex-packages-alist '("" "xcolor"))
;(add-to-list 'org-latex-packages-alist '("" "minted"))

(setq org-latex-listings t)
(setq org-latex-listings-options
      '(("basicstyle"          "\\small")
        ("breaklines"          "true")
        ("breakatwhitespace"   "true")
        ("showspaces"          "false")
        ("frame"               "single")))

;; code block fontification
(setq org-src-fontify-natively  t
      org-src-tab-acts-natively t)

;; latex compiler
(setq org-latex-compiler "xelatex")

(provide 'init-org)
