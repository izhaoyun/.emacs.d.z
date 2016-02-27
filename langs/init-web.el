;;; init-web.el --- to do

;;; Commentary:

;;; Code:
;; Package: emmet-mode
(el-get-bundle emmet-mode)
(require 'emmet-mode)

;; Package: web-mode.el
(el-get-bundle web-mode)
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'"     . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'"   . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'"   . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'"       . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'"  . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'"    . web-mode))

(provide 'init-web)
;;; init-web.el ends here
