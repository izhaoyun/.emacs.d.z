;;; init-avy.el --- jumping to visible text

;;; Commentary:

;;; Code:

;; Package: avy
(el-get-bundle avy)
(global-set-key (kbd "C-:") 'avy-goto-char)
(global-set-key (kbd "C-'") 'avy-goto-char-2)
(global-set-key (kbd "M-g f") 'avy-goto-line)
(global-set-key (kbd "M-g w") 'avy-goto-word-1)
(global-set-key (kbd "M-g e") 'avy-goto-word-0)

;; Package: ace-pinyin
(el-get-bundle cute-jumper/ace-pinyin)
;; (require 'ace-pinyin)
(setq ace-pinyin-use-avy t)
;; (ace-pinyin-global-mode +1)

(provide 'init-avy)
;;; init-avy.el ends here
