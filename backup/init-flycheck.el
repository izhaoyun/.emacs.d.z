;;; init-flycheck.el --- Flycheck

;;; Commentary:

;;; Code:
;; Package: flycheck
(el-get-bundle flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)

;; Package: flycheck-pos-tip
(el-get-bundle flycheck-pos-tip)
(with-eval-after-load 'flycheck
  (flycheck-pos-tip-mode))

(provide 'init-flycheck)
;;; init-flycheck.el ends here
