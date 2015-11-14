;;; provides many packages useful for c/c++ programming, besides
;;; company kits

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

(provide 'init-cc)
