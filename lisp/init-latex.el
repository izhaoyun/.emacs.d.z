;; Package: auctex
(el-get-bundle auctex)
(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

(setq TeX-command-default "XeLaTeX")
(setq-default TeX-engine 'xetex)

(provide 'init-latex)
