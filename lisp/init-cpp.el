;;; provides packages useful for c/c++ development




;; (setq company-backends (delete 'company-semantic company-backends))
;; (define-key c-mode-map  [(tab)] 'company-complete)
;; (define-key c++-mode-map  [(tab)] 'company-complete)
;; (el-get-bundle company-c-headers)
;; (add-to-list 'company-backends 'company-c-headers)


;; Package: cedet
(el-get-bundle cedet)

;; (require 'cedet-devel-load)
(load-file (concat user-emacs-directory
                   "~/.emacs.d/el-get/cedet/cedet-devel-load.el"))
(load-file (concat user-emacs-directory
                   "~/.emacs.d/el-get/cedet/contrib/cedet-contrib-load.el"))

(require 'semantic/senator)
(require 'semantic/ia)
(require 'semantic/analyze/refs)
(require 'semantic/analyze/complete)
(require 'semantic/bovine/gcc)
(require 'semantic/mru-bookmark)

(add-to-list 'semantic-default-submodes 'global-semantic-mru-bookmark-mode)
(add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-scheduler-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)
(add-to-list 'semantic-default-submodes 'global-cedet-m3-minor-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-highlight-func-mode)
(add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)

(require 'semantic/ia)

(defun alexott/cedet-hook ()
  (local-set-key "\C-c\C-j" 'semantic-ia-fast-jump)
  (local-set-key "\C-c\C-s" 'semantic-ia-show-summary))

(add-hook 'c-mode-common-hook 'alexott/cedet-hook)
(add-hook 'c-mode-hook 'alexott/cedet-hook)
(add-hook 'c++-mode-hook 'alexott/cedet-hook)

(require 'cc-mode)
(require 'semantic)

(global-semanticdb-minor-mode 1)
(global-semantic-idle-scheduler-mode 1)
(global-semantic-idle-summary-mode 1)

(semantic-add-system-include "/usr/include" 'c++-mode)
(semantic-add-system-include "/usr/include/boost" 'c++-mode)
;; (semantic-add-system-include "/usr/include/opencv" 'c++-mode)
;; (semantic-add-system-include "/usr/local/include" 'c++-mode)

(semantic-mode 1)

;; setup gdb
(setq gdb-many-windows t
      gdb-show-main t)

(provide 'init-cpp)
