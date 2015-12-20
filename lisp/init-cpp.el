;;; provides packages useful for c/c++ development

;; Package: sr-speedbar
(el-get-bundle sr-speedbar)
;; speedbar
(setq speedbar-show-unknown-files t)


;; Package: helm-gtags
(el-get-bundle helm-gtags)

(setq helm-gtags-ignore-case t
      helm-gtags-auto-update t
      helm-gtags-use-input-at-cursor t
      helm-gtags-pulse-at-cursor t
      helm-gtags-prefix-key "\C-cg"
      helm-gtags-suggested-key-mapping t)

(require 'helm-gtags)
;; Enable helm-gtags-mode
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

;; Package: company
(el-get-bundle company)
(require 'company)
(setq company-show-numbers t)
;; (setq company-backends (delete 'company-semantic company-backends))
;; (define-key c-mode-map  [(tab)] 'company-complete)
;; (define-key c++-mode-map  [(tab)] 'company-complete)
;; (el-get-bundle company-c-headers)
;; (add-to-list 'company-backends 'company-c-headers)

;; (add-hook 'after-init-hook 'global-company-mode)
(add-hook 'prog-mode-hook 'company-mode)

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

;; Package: semantic-stickyfunc-mode
(el-get-bundle semantic-stickyfunc-enhance)
(add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)
;; (semantic-mode 1)
(require 'stickyfunc-enhance)


;; Package: function-args
(el-get-bundle function-args)
(require 'function-args)
(fa-config-default)
(define-key c-mode-map  [(control tab)] 'moo-complete)
(define-key c++-mode-map  [(control tab)] 'moo-complete)
(define-key c-mode-map (kbd "M-o")  'fa-show)
(define-key c++-mode-map (kbd "M-o")  'fa-show)

;; Package: CMake-mode
(el-get-bundle cmake-mode)
(require 'cmake-mode)
(setq auto-mode-alist (append '(("CMakeLists\\.txt\\'" . cmake-mode)
                                ("\\.cmake\\'"         . cmake-mode))
                              auto-mode-alist))

;; Package: CMake-font-lock
(el-get-bundle cmake-font-lock)
(autoload 'cmake-font-lock-activate "cmake-font-lock" nil t)
(add-hook 'cmake-mode-hook 'cmake-font-lock-activate)

;; setup gdb
(setq gdb-many-windows t
      gdb-show-main t)

(provide 'init-cpp)
