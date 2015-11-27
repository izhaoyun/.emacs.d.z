;; Package: python-mode
(el-get-bundle python-mode)
(require 'python-mode)
(setq-default py-shell-name "ipython")
(setq-default py-which-bufname "IPython")
(setq py-smart-indentation t)

;; Package: anaconda-mode
(el-get-bundle anaconda-mode)
(add-hook 'python-mode-hook 'anaconda-mode)

;; Package: company-anaconda
(el-get-bundle company-anaconda)
(add-to-list 'company-backends 'company-anaconda)

;; Package: pyenv-mode
(el-get-bundle pyenv-mode)
(pyenv-mode)

(provide 'init-python)
