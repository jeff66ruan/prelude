;;; setup-c.el --- c programming related configuration
;;; commentary:

;;; code:

(if (or (string-equal system-type "cygwin")
        (string-equal system-type "windows-nt"))
    (setq-default buffer-file-coding-system 'prefer-utf-8-dos))

(provide 'setup-c)
;;; setup-c.el ends here
