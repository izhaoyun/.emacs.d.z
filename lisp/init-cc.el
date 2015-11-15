;;; provides many packages useful for c/c++ programming, besides
;;; company kits

;; cc-mode
(require 'cc-mode)

;; Package: function-args
(el-get-bundle function-args)
(require 'function-args)
(fa-config-default)
(define-key c-mode-map    [(control tab)] 'moo-complete)
(define-key c++-mode-map  [(control tab)] 'moo-complete)
(define-key c-mode-map   (kbd "M-o")  'fa-show)
(define-key c++-mode-map (kbd "M-o")  'fa-show)

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

;; Package: semantic-stickyfunc-mode
(el-get-bundle semantic-stickyfunc-enhance)
(add-to-list 'semantic-default-submodes
             'global-semantic-stickyfunc-mode)
(semantic-mode 1)
(require 'stickyfunc-enhance)

(provide 'init-cc)
