;;; init-cc.el --- C/C++ programming

;;; Commentary:

;;; Code:

(require 'cc-mode)

(setq-default c-basic-offset 4
              c-default-style "linux")

;; (setq company-backends (delete 'company-semantic company-backends))

(define-key c-mode-map   [(tab)] 'company-complete)
(define-key c++-mode-map [(tab)] 'company-complete)

;; Package: company-c-headers
(el-get-bundle company-c-headers)
(add-to-list 'company-backends 'company-c-headers)

;; Package: helm-gtags
(el-get-bundle helm-gtags)
(setq helm-gtags-ignore-case           t
      helm-gtags-auto-update           t
      helm-gtags-use-input-at-cursor   t
      helm-gtags-pulse-at-cursor       t
      helm-gtags-suggested-key-mapping t)
(setq helm-gtags-prefix-key "\C-cg")

(require 'helm-gtags)
(add-hook 'dired-mode-hook 'helm-gtags-mode)
(add-hook 'eshell-mode-hook 'helm-gtags-mode)
(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'asm-mode-hook 'helm-gtags-mode)
;; key settings for helm-gtags
(define-key helm-gtags-mode-map (kbd "C-j") 'helm-gtags-select)
(define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
(define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
(define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
(define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)
(define-key helm-gtags-mode-map (kbd "C-c g a")
  'helm-gtags-tags-in-this-function)

(setq-local imenu-create-index-function #'ggtags-build-imenu-index)

;; CEDET
(el-get-bundle cedet)

(load "~/.emacs.d/el-get/cedet/cedet-devel-load.el")
(load "~/.emacs.d/el-get/cedet/contrib/cedet-contrib-load.el")

(require 'semantic/senator)
(require 'semantic/ia)
(require 'semantic/analyze/refs)
(require 'semantic/analyze/complete)
(require 'semantic/bovine/gcc)
(require 'semantic/mru-bookmark)

(add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-mru-bookmark-mode)
;(add-to-list 'semantic-default-submodes 'global-cedet-m3-minor-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-highlight-func-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)
;(add-to-list 'semantic-default-submodes 'global-semantic-decoration-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-local-symbol-highlight-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-scheduler-mode)
;(add-to-list 'semantic-default-submodes 'global-semantic-idle-completions-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-summary-mode)
(semantic-mode 1)

(defun alexott/cedet-hook ()
  (local-set-key "\C-c\C-j" 'semantic-ia-fast-jump)
  (local-set-key "\C-c\C-j" 'semantic-ia-show-summary))

(add-hook 'c-mode-common-hook 'alexott/cedet-hook)
(add-hook 'c-mode-hook 'alexott/cedet-hook)
(add-hook 'c++-mode-hook 'alexott/cedet-hook)

(semantic-add-system-include "/usr/include/boost" 'c++-mode)

(require 'semantic)

;; Package: semantic-stickyfunc-mode
(el-get-bundle semantic-stickyfunc-enhance)
(add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)
(require 'stickyfunc-enhance)

;; Package: function-args
(el-get-bundle function-args)
(require 'function-args)
(fa-config-default)
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(set-default 'semantic-case-fold t)

;; Package: CMake-mode
(el-get-bundle cmake-mode)
(require 'cmake-mode)
(setq auto-mode-alist (append '(("CMakeLists\\.txt\\'" . cmake-mode)
                                ("\\.cmake\\'"         . cmake-mode))
                              auto-mode-alist))

;; Package: CMake-font-lock
(el-get-bundle Lindydancer/cmake-font-lock)
(autoload 'cmake-font-lock-activate "cmake-font-lock" nil t)
(add-hook 'cmake-mode-hook 'cmake-font-lock-activate)

;; folding
(add-hook 'c-mode-common-hook 'hs-minor-mode)

;; compilation
(global-set-key (kbd "<f5>") (lambda ()
                               (interactive)
                               (setq-local compilation-read-command nil)
                               (call-interactively 'compile)))

;; debugging
(setq gdb-many-windows t
      gdb-show-main t)

;; Package: flycheck-google-cpplint
(el-get-bundle flycheck/flycheck-google-cpplint)
;; (eval-after-load 'flycheck
;;   '(progn
;;      (require 'flycheck-google-cpplint)
;;      (flycheck-add-next-checker 'c/c++-clang
;;                                 '(warnings-only . c/c++-googlelint))
;;      (custom-set-variables
;;       '(flycheck-googlelint-verbose "3")
;;       '(flycheck-googlelint-filter "-whitespace,+whitespace/braces")
;;       '(flycheck-googlelint-linelength "120"))))

(provide 'init-cc)
;;; init-cc.el ends here
