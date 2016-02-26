;;; init-hydra.el --- make Emacs bindings that stick around

;;; Commentary:

;;; Code:
;; Package: hydra
(el-get-bundle hydra)
(require 'hydra)
(defhydra hydra-zoom (global-map "<f2>")
  "zoom"
  ("g" text-scale-increase "in")
  ("l" text-scale-decrease "out"))

(provide 'init-hydra)
;;; init-hydra.el ends here
