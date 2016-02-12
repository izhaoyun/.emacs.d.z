(el-get-bundle yasnippet)

(require 'yasnippet)
(setq yas-snippet-dirs
      '("~/.emacs.d/snippets"		       ;; personal snippets
        "~/.emacs.d/el-get/yasnippet/snippets" ;; the default collection
        ))

;; Inter-field navigation
(defun yas/goto-end-of-active-field ()
  (interactive)
  (let* ((snippet (car (yas--snippets-at-point)))
		 (position (yas--field-end (yas--snippet-active-field snippet))))
	(if (= (point) position)
	  (move-end-of-line 1)
	  (goto-char position))))

(defun yas/goto-start-of-active-field ()
  (interactive)
  (let* ((snippet (car (yas--snippets-at-point)))
		 (position (yas--field-start (yas--snippet-active-field snippet))))
	(if (= (point) position)
	  (move-beginning-of-line 1)
	  (goto-char position))))

(define-key yas-keymap (kbd "C-e") 'yas/goto-end-of-active-field')
(define-key yas-keymap (kbd "C-a") 'yas/goto-start-of-active-field')

(yas-global-mode 1)

(provide 'init-yasnippet)

