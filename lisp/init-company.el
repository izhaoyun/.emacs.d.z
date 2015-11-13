;; company
(el-get-bundle company)

(require 'company)
(setq company-show-numbers t)
(add-hook 'after-init-hook 'global-company-mode)

(provide 'init-company)
