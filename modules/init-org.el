;; Package: org-mode
(use-package org
  :pin manual
  :load-path ("~/.emacs.d/src/org-mode/lisp"
              "~/.emacs.d/src/org-mode/contrib/lisp")
  :mode ("\\.org$" . org-mode)
  :bind
  (("C-c a" . org-agenda)
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
  (use-package org-bullets
    :defer t
    :init
    (add-hook 'org-mode-hook 'org-bullets-mode))
  (use-package htmlize)

  )

(provide 'init-org)
