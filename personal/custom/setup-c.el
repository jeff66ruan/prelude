;;; setup-c.el --- c programming related configuration
;;; commentary:

;;; code:

(if (or (string-equal system-type "cygwin")
        (string-equal system-type "windows-nt"))
    (setq-default buffer-file-coding-system 'prefer-utf-8-dos))

(defun my-c-mode-hook ()
  "My customizations for all of c mode and related modes."
  (setq c-default-style
        '((java-mode . "java")
          (awk-mode . "awk")
          (other . "k&r")))

  (setq-default c-basic-offset 4
                tab-width 4
                indent-tabs-mode nil)

  )
(add-hook 'c-mode-hook 'my-c-mode-hook)

(provide 'setup-c)
;;; setup-c.el ends here
