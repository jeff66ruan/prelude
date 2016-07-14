;;; setup-c.el --- c programming related configuration
;;; commentary:

;;; code:

(defun my-c-mode-hook ()
  "My customizations for all of c mode and related modes."
  (setq c-default-style
        '((java-mode . "java")
          (awk-mode . "awk")
          (other . "k&r")))

  (setq-default c-basic-offset 4
                tab-width 4)

  )
(add-hook 'c-mode-hook 'my-c-mode-hook)

(provide 'setup-c)
;;; setup-c.el ends here
