;;; init-org.el --- Configuration for org-mode


;;; Commentary:


;;; Code:
(el-get-bundle org-mode)


(add-hook 'org-mode-hook
          (lambda ()
            (org-set-local 'yas/trigger-key [tab])
            (define-key yas/keymap [tab] 'yas/next-field-or-maybe-expand)))


(provide 'init-org)
;;; init-org.el ends here
