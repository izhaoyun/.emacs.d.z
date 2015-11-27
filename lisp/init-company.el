;; Package: company
(el-get-bundle company)
(require 'company)
(setq company-show-numbers t)

;; (add-hook 'after-init-hook 'global-company-mode)
(add-hook 'prog-mode-hook 'company-mode)

(provide 'init-company)
