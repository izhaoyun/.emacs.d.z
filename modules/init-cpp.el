(use-package cc-mode
  :mode
  (("\\.h$" . c++-mode)))

(use-package company-c-headers
  :init)

(use-package cmake-mode
  :pin marmalade
  :mode
  (("CMakeLists\\.txt\\'" . cmake-mode)
   ("\\.cmake\\'" . cmake-mode)))

(use-package gdb-mi
  :defer t
  :init
  (setq gdb-many-windows t
        gdb-show-main    t))

(use-package cedet
  :defer t
  :pin manual
  :init
  (progn
    (load-file "~/.emacs.d/src/cedet/cedet-devel-load.el")
    (load-file "~/.emacs.d/src/cedet/contrib/cedet-contrib-load.el")
    (require 'semantic)))

(provide 'init-cpp)
;;; init-cpp.el ends here
