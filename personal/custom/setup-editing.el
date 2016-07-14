;;; setup-editing.el --- basic editing setting
;;; commentary:

;;; code:

;; coding-system
(if (or (string-equal system-type "cygwin")
        (string-equal system-type "windows-nt"))
    (setq-default buffer-file-coding-system 'prefer-utf-8-dos))

(defun unix-file ()
  "Change the current buffer to prefer-utf-8 with Unix line-ends."
  (interactive)
  (set-buffer-file-coding-system 'prefer-utf-8-unix t))

(defun dos-file ()
  "Change the current buffer to prefer-utf-8 with dos line-ends."
  (interactive)
  (set-buffer-file-coding-system 'prefer-utf-8-dos t))

(defun mac-file ()
  "Change the current buffer to prefer-utf-8 with mac line-ends."
  (interactive)
  (set-buffer-file-coding-system 'prefer-utf-8-mac t))

(defun getatemp ()
  "Function to create a temp buffer."
  (interactive)
  (switch-to-buffer (make-temp-name "scratch")))

;; highlight symbol
(prelude-require-packages '(highlight-symbol))
(dolist (hook '(prog-mode-hook html-mode-hook))
  (add-hook hook 'highlight-symbol-mode)
  (add-hook hook 'highlight-symbol-nav-mode))
(eval-after-load 'highlight-symbol
  '(diminish 'highlight-symbol-mode))

(provide 'setup-editing)
;;; setup-editing.el ends here
