;;; setup-helm.el --- own aditional helm configuration
;;; commentary:

;;; code:

;; (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebihnd tab to do persistent action
;; (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
;; (define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(helm-autoresize-mode t)

(provide 'setup-helm)

;;; setup-helm.el ends here
