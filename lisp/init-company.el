;; Package: company
(el-get-bundle company)

(require 'company)
(setq company-show-numbers t)
;; use company-mode in all buffers
(add-hook 'after-init-hook 'global-company-mode)

;; because company-semantic has higher precedence in company-backends
(setq company-backends (delete 'company-semantic company-backends))
(define-key c-mode-map   [(tab)] 'company-complete)
(define-key c++-mode-map [(tab)] 'company-complete)
;; to retrieve completion candidates for your projects, create a file
;; named .dir-locals.el at the project root.
;; ((nil . ((company-clang-arguments . ("-I/path-to/project_root/include/"
;;                                      "-I/path-to/project_root/include/))

;; Package: company-c-headers
(el-get-bundle company-c-headers)
(add-to-list 'company-backends 'company-c-headers)
;; to complete project local, use company-c-headers-path-user and put
;; it in .dir-locals.el

(provide 'init-company)
