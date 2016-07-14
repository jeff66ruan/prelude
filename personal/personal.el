;;; personal.el --- personalizing.
;;; Commentary:
;;
;;; code:
;; install pacakges
(prelude-require-packages '(helm-gtags ag))

(defvar personal-custom-dir (expand-file-name "custom" prelude-personal-dir)
  "This directory is for my personal custom configuration, that you want loaded by personal.el.")

(add-to-list 'load-path personal-custom-dir)

(require 'setup-helm-gtags)
;; (require 'setup-ggtags)  either helm-gtags or ggtags
(require 'setup-cedet)
(require 'setup-c)
(require 'setup-themes)

;; setup the projectile
(setq projectile-indexing-method 'alien)
(setq projectile-enable-caching t)

;; turn off whitespace on specific machine
(when (string-equal system-name "NZ171.px.dps.local")
  (setq prelude-whitespace nil)
  (setq prelude-clean-whitespace-on-save nil)
  )

;; ;; setup windows
;; (if (equal system-type 'windows-nt) (require 'setup-windows))

(provide 'personal)
