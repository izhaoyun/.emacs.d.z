;;; provides packages useful for c/c++ development
;; ===================================================================
;; Package: cedet
(el-get-bundle cedet)

(require 'cedet-devel-load)

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

(semantic-mode 1)

(require 'semantic/ia)

(defun alexott/cedet-hook ()
  (local-set-key "\C-c\C-j" 'semantic-ia-fast-jump)
  (local-set-key "\C-c\C-s" 'semantic-ia-show-summary))

;; Package: semantic-stickyfunc-mode
(el-get-bundle semantic-stickyfunc-enhance)
(add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)
(semantic-mode 1)
(require 'stickyfunc-enhance)

;; ===================================================================
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
(define-key helm-gtags-mode-map (kbd "C-c <")
  'helm-gtags-previous-history)
(define-key helm-gtags-mode-map (kbd "C-c >")
  'helm-gtags-next-history)
(define-key helm-gtags-mode-map (kbd "C-c g a")
  'helm-gtags-tags-in-this-function)

(setq-local imenu-create-index-function #'ggtags-build-imenu-index)

;; ===================================================================
;; Package: sr-speedbar
(el-get-bundle sr-speedbar)

;; speedbar
(setq speedbar-show-unknown-files t)

;; ===================================================================
;; Package: function-args
(el-get-bundle function-args)
(require 'function-args)
(fa-config-default)
(define-key c-mode-map    [(control tab)] 'moo-complete)
(define-key c++-mode-map  [(control tab)] 'moo-complete)
(define-key c-mode-map   (kbd "M-o")  'fa-show)
(define-key c++-mode-map (kbd "M-o")  'fa-show)

;; ===================================================================
;; Package: CMake-mode
(el-get-bundle cmake-mode)
(require 'cmake-mode)
(setq auto-mode-alist
      (append '(("CMakeLists\\.txt\\'" . cmake-mode)
                ("\\.cmake\\'"         . cmake-mode))
              auto-mode-alist))

;; Package: CMake-font-lock
(el-get-bundle cmake-font-lock)
(autoload 'cmake-font-lock-activate "cmake-font-lock" nil t)
(add-hook 'cmake-mode-hook 'cmake-font-lock-activate)

;; ===================================================================
;; setup GDB
(setq gdb-many-windows t
      gdb-show-main t)

(provide 'init-cpp)
