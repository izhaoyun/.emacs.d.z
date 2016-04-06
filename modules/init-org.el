;; Package: org-mode
(use-package org
  :ensure org-plus-contrib
  :pin manual
  :mode ("\\.org$" . org-mode)
  :bind (("C-c a" . org-agenda)
         ("C-c b" . org-iswitchb)
         ("C-c c" . org-capture)
         ("C-c l" . org-store-link))
  :commands org-mode
  :defer 1
  :config
  ;; Withing with Code Blocks
  (use-package ob-ditaa 
    :ensure nil
    :init
    (setq org-ditaa-jar-path "/usr/share/java/ditaa/ditaa-0_9.jar"))
  (use-package ob-plantuml :ensure nil)
  (use-package ob-ruby :ensure nil)
  (use-package ob-shell :ensure nil)
  (use-package ob-python :ensure nil)
  (use-package ob-sed :ensure nil)
  (use-package ob-awk :ensure nil)
  (use-package ob-latex :ensure nil)
  (use-package ob-C :ensure nil)
  (use-package ob-sql :ensure nil)
  (use-package ob-dot :ensure nil)

  (setq org-src-fontify-natively t)
  (setq org-src-tab-acts-natively t)
  
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)
     (ditaa      . t)
     (ruby       . t)
     (python     . t)
     (shell      . t)
     (plantuml   . t)
     (latex      . t)
     (sed        . t)
     (awk        . t)
     (C          . t)
     (sql        . t)
     (dot        . t)))

  ;;; Export Section
  (add-to-list 'org-latex-packages-alist '("" "ctex"))
  (add-to-list 'org-latex-packages-alist '("" "listings"))
  (add-to-list 'org-latex-packages-alist '("" "color"))
  (add-to-list 'org-latex-packages-alist '("" "geometry"))
  (add-to-list 'org-latex-packages-alist '("dvipsnames" "xcolor"))
  (add-to-list 'org-latex-packages-alist '("" "minted"))
  (add-to-list 'org-latex-packages-alist '("" "tabularx"))
  (add-to-list 'org-latex-packages-alist '("" "tabu"))
  
  (use-package ox :ensure nil
    :init
    (setq org-export-default-language "zh-CN")
    :config
    (use-package ox-beamer :ensure nil)
    (use-package ox-md :ensure nil)
    (use-package ox-gfm :ensure nil)
    (use-package ox-latex :ensure nil
      :init
      (setq org-latex-compiler "xelatex")
      (setq org-latex-listings 'minted)
      ;; http://ctan.mirrorcatalogs.com/macros/latex/contrib/minted/minted.pdf
      (setq org-latex-minted-options
            '(("frame"         "single")
              ;; ("linenos"       "")
              ("breaklines"    "")))
      (setq org-latex-pdf-process
            '("xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
              "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
              "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
              ))) ; ox-latex settings ends here.

    ;; ;; remove linebreak for cjk (http://zwz.github.io/)
    ;; (defun clear-single-linebreak-in-cjk-string (string)
    ;;   "clear single line-break between cjk characters that is usually soft line-breaks"
    ;;   (let* ((regexp "\\([\u4E00-\u9FA5]\\)\n\\([\u4E00-\u9FA5]\\)")
    ;;          (start (string-match regexp string)))
    ;;     (while start
    ;;       (setq string (replace-match "\\1\\2" nil nil string)
    ;;             start (string-match regexp string start))))
    ;;   string)
    
    ;; (defun ox-html-clear-single-linebreak-for-cjk (string backend info)
    ;;   (when (org-export-derived-backend-p backend 'html)
    ;;     (clear-single-linebreak-in-cjk-string string)))
    
    ;; (add-to-list 'org-export-filter-final-output-functions
    ;;              'ox-html-clear-single-linebreak-for-cjk)
    ))

(use-package org-bullets
  :ensure nil
  :init (add-hook 'org-mode-hook 'org-bullets-mode))

(use-package htmlize)

(provide 'init-org)
