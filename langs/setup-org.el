(use-package org
  :mode (("\\.org$" . org-mode))
  :bind
  (("C-c a" . org-agenda)
   ("C-c b" . org-iswitchb)
   ("C-c c" . org-capture)
   ("C-c l" . org-store-link))
  :init
  (setq org-src-fontify-natively t)
  (setq org-src-tab-acts-natively t)
  (add-hook 'org-mode-hook 'init-org-bullets)

  :config
  (add-hook 'org-mode-hook 'init-org-babel)
  (add-hook 'org-mode-hook 'init-org-export))

(defun init-org-babel ()
  "settings for org-babel."
  (use-package ob-C          :ensure org)
  (use-package ob-awk        :ensure org)
  (use-package ob-dot        :ensure org)
  (use-package ob-sed        :ensure org)
  (use-package ob-sql        :ensure org)
  (use-package ob-ruby       :ensure org)
  (use-package ob-ditaa      :ensure org)
  (use-package ob-shell      :ensure org)
  (use-package ob-python     :ensure org)
  (use-package ob-plantuml   :ensure org)  
  (use-package ob-emacs-lisp :ensure org)
  
  (use-package ob            :ensure org
    :init
    (org-babel-do-load-languages
     'org-babel-load-languages
     '((C          . t)
       (awk        . t)
       (dot        . t)
       (sed        . t)
       (sql        . t)
       (ruby       . t)
       (ditaa      . t)
       (shell      . t)
       (python     . t)
       (plantuml   . t)
       (emacs-lisp . t)
       )
     ))
  )

(defun init-org-export ()
  "settings for export"
  (use-package ox-beamer :ensure org)
  (use-package ox-gfm    :ensure org-plus-contrib)

  (use-package ox-latex
    :ensure org
    :init
    (setq org-latex-listings 'minted)
    ;; alist of packages to be inserted in every LaTeX header.
    (add-to-list 'org-latex-packages-alist '("" "ctex"))
    (add-to-list 'org-latex-packages-alist '("" "minted"))
    )
  
  (use-package ox
    :ensure org
    :init
    (setq org-export-default-language "zh-CN"))
  )

(defun init-org-bullets ()
  (use-package org-bullets
    :ensure org-plus-contrib
    :init
    (org-bullets-mode 1))
  )

(provide 'setup-org)
