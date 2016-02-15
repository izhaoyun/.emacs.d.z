;;; init-ido.el --- ido-mode

;;; Commentary:

;;; Code:

(ido-mode t)
(setq ido-enable-flex-matching t)

;; Package: smex
(el-get-bundle smex)
;; TODO: configuration for smex

(provide 'init-ido)
;;; init-ido.el ends here
