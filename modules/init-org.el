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
  (progn
    (require 'org)
    (require 'ox)
    (require 'ox-beamer)
    (require 'ox-latex)
    (require 'ox-gfm))
  :config

  ;; Package: org-bullets
  (use-package org-bullets :defer t :load-path "src/org-mode/contrib/lisp"
    :init
    (add-hook 'org-mode-hook 'org-bullets-mode))

  ;; Package: ob-ditaa
  ;; (use-package ob-ditaa :defer t :load-path "src/org-mode/lisp")

  ;; Package: htmlize
  (use-package htmlize)
  )

(provide 'init-org)
