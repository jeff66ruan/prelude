;;; setup-editing.el --- basic editing setting
;;; commentary:

;;; code:

;;
(defun switch-between-two-recent-buffers ()
  "Switching Between Two Recently Used Buffers."
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))
(global-set-key (kbd "<f6>") 'switch-between-two-recent-buffers)

;; coding-system on windows or cygwin or my particular box use dos end of line
(if (or (string-equal system-type "cygwin")
        (string-equal system-type "windows-nt")
        (string-equal system-name "archbox"))
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
