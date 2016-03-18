;; Package: org-mode
(use-package org
  :pin org
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
    (use-package org-plus-contrib :pin org
      :init
      (progn
        (require 'org-bullets)
        (require 'ox-gfm))))
  :config
  (progn
    (use-package org-bullets
      :defer t
      :init
      (add-hook 'org-mode-hook 'org-bullets-mode))
    (use-package htmlize)))

(provide 'init-org)
