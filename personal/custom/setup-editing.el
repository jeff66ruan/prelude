;;; setup-editing.el --- basic editing setting
;;; commentary:

;;; code:

(setq-default
 scroll-preserve-screen-position 'always
 prelude-whitespace nil
 prelude-clean-whitespace-on-save nil
 indent-tabs-mode nil)

(scroll-bar-mode -1)

(set-face-attribute 'default nil :height 120)

(when (string-equal system-type "darwin")
  (set-face-attribute 'default nil :height 140))

;; switch between buffers
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

(defun rename-this-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (unless filename
      (error "Buffer '%s' is not visiting a file!" name))
    (if (get-buffer new-name)
        (message "A buffer named '%s' already exists!" new-name)
      (progn
        (when (file-exists-p filename)
         (rename-file filename new-name 1))
        (rename-buffer new-name)
        (set-visited-file-name new-name)))))

(defun browse-current-file ()
  "Open the current file as a URL using `browse-url'."
  (interactive)
  (let ((file-name (buffer-file-name)))
    (if (and (fboundp 'tramp-tramp-file-p)
             (tramp-tramp-file-p file-name))
        (error "Cannot open tramp file")
      (browse-url (concat "file://" file-name)))))

;; highlight symbol
(prelude-require-packages '(highlight-symbol))
(dolist (hook '(prog-mode-hook html-mode-hook))
  (add-hook hook 'highlight-symbol-mode)
  (add-hook hook 'highlight-symbol-nav-mode))
(eval-after-load 'highlight-symbol
  '(diminish 'highlight-symbol-mode))

(provide 'setup-editing)
;;; setup-editing.el ends here
