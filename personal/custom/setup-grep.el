(setq-default grep-highlight-matches t
              grep-scroll-output t)

(when (eq system-type 'darwin)
  (setq-default locate-command "mdfind"))

(when (executable-find "ag")
  (prelude-require-packages '(ag wgrep-ag))
  (setq-default ag-highlight-search t)
  (global-set-key (kbd "M-?") 'ag-project))


(provide 'setup-grep)
