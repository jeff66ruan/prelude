;;; personal.el --- personalizing.
;;; Commentary:
;;
;;; code:
;; install pacakges
(prelude-require-packages '(helm-gtags))

(defvar personal-custom-dir (expand-file-name "custom" prelude-personal-dir)
  "This directory is for my personal custom configuration, that you want loaded by personal.el.")

(add-to-list 'load-path personal-custom-dir)

(require 'setup-editing)
(require 'setup-grep)
(require 'setup-helm)
(require 'setup-helm-gtags)
;; (require 'setup-ggtags)  either helm-gtags or ggtags
(require 'setup-cedet)
(require 'setup-c)
;; (require 'setup-themes)

(prelude-require-packages '(helm-descbinds))
(require 'helm-descbinds)
(helm-descbinds-mode)

;; setup the projectile
(setq projectile-switch-project-action 'helm-projectile)
(setq projectile-indexing-method 'alien)
(setq projectile-enable-caching t)
(setq projectile-svn-command "find . -type f -print0")

;; ;; setup windows
;; (if (equal system-type 'windows-nt) (require 'setup-windows))

(provide 'personal)
