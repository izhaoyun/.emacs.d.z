;;; init-org.el --- Configuration for org-mode


;;; Commentary:


;;; Code:
(el-get-bundle org-mode)

(require 'org)
(require 'ob)
(require 'ox)
(require 'ox-md)
(require 'ox-latex)
(require 'ox-beamer)

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

;; (setq initial-major-mode 'org-mode)

;; key bindings
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

(add-hook 'org-mode-hook
  (lambda ()
    (local-set-key (kbd "C-&") 'org-mark-ring-goto)
    (local-set-key (kbd "C-%") 'org-mark-ring-push)))

;; solving conflicts with yasnippet
(add-hook 'org-mode-hook
          (lambda ()
            (org-set-local 'yas/trigger-key [tab])
            (define-key yas/keymap [tab] 'yas/next-field-or-maybe-expand)))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (python     . t)
   (sh         . t)
   (dot        . t)
   (org        . t)
   (ruby       . t)
   (latex      . t)
   (plantuml   . t)
   (ditaa      . t)
   (sql        . t)
   (C          . t)))
(setq org-confirm-babel-evaluate nil)

;; org latex listings
(add-to-list 'org-latex-packages-alist '("" "ctex"))
(add-to-list 'org-latex-packages-alist '("" "listings"))
(add-to-list 'org-latex-packages-alist '("" "color"))
(add-to-list 'org-latex-packages-alist '("" "geometry"))
(add-to-list 'org-latex-packages-alist '("dvipsnames" "xcolor"))
(add-to-list 'org-latex-packages-alist '("" "minted"))
(add-to-list 'org-latex-packages-alist '("" "tabularx"))
(add-to-list 'org-latex-packages-alist '("" "tabu"))

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

;; (setcdr (assoc "\\.pdf\\'" org-file-apps) "evince %s")

(setq org-todo-keywords
      '((sequence "TODO(t)" "|" "DONE(d)")
        (sequence "REPORT(r)" "BUG(b)" "KNOWNCAUSE(k)" "|" "FIXED(f)")
        (sequence "|" "CANCELED(c)")))

(setq org-log-done 'note)

;; remove linebreak for cjk
;; http://zwz.github.io/
(defun clear-single-linebreak-in-cjk-string (string)
  "clear single line-break between cjk characters that is usually soft line-breaks"
  (let* ((regexp "\\([\u4E00-\u9FA5]\\)\n\\([\u4E00-\u9FA5]\\)")
         (start (string-match regexp string)))
    (while start
      (setq string (replace-match "\\1\\2" nil nil string)
            start (string-match regexp string start))))
  string)

(defun ox-html-clear-single-linebreak-for-cjk (string backend info)
  (when (org-export-derived-backend-p backend 'html)
    (clear-single-linebreak-in-cjk-string string)))

(add-to-list 'org-export-filter-final-output-functions
             'ox-html-clear-single-linebreak-for-cjk)

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(provide 'init-org)
;;; init-org.el ends here
