;; Package: python.el
(el-get-bundle python24)

;; ElDoc
(add-hook 'python-mode-hook 'eldoc-mode)

;; Package: anaconda-mode
(el-get-bundle anaconda-mode)
(add-hook 'python-mode-hook 'anaconda-mode)

;; Package: company-anaconda
(el-get-bundle company-anaconda)
(add-to-list 'company-backends 'company-anaconda)

(provide 'init-python)
