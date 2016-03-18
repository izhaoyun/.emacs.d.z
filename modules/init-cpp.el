(use-package cc-mode
  :mode
  (("\\.h$" . c++-mode)))

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

(provide 'init-cpp)
;;; init-cpp.el ends here
