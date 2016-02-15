;;; init-session.el --- Session management

;;; Commentary:

;;; Code:

;; Package: workgroups2
(el-get-bundle workgroups2)
(require 'workgroups2)
(setq wg-session-file "~/.emacs.d/.emacs_workgroups")
(workgroups-mode 1)

(provide 'init-session)
;;; init-session.el ends here
