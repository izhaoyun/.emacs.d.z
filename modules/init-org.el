;; Package: org-mode
(use-package org
  :pin manual
  :load-path ("src/org-mode/lisp"
              "src/org-mode/contrib/lisp")
  :mode ("\\.org$" . org-mode)
  :bind (("C-c a" . org-agenda)
         ("C-c b" . org-iswitchb)
         ("C-c c" . org-capture)
         ("C-c l" . org-store-link))
  :init
  (use-package org)
  
  :config
  ;; Withing with Code Blocks
  (use-package ob :ensure nil
    :config
    (use-package ob-ditaa :ensure nil)
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
    )
  
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
  (use-package ox :ensure nil
    :init
    (setq org-export-default-language "zh-CN")
    :config
    (use-package ox-beamer :ensure nil)
    (use-package ox-md :ensure nil)
    (use-package ox-gfm :ensure nil)
    )


  ;;; Others
  (use-package org-bullets
    :init (add-hook 'org-mode-hook 'org-bullets-mode))

  (use-package htmlize)
  )

(provide 'init-org)
