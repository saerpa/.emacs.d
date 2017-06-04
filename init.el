
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; Temporarily reduce garbage collection during startup
(defconst sanityinc/initial-gc-cons-threshold gc-cons-threshold
  "Initial value of `gc-cons-threshold' at start-up time.")
(setq gc-cons-threshold (* 128 1024 1024))
(add-hook 'after-init-hook
          (lambda () (setq gc-cons-threshold sanityinc/initial-gc-cons-threshold)))

;; Bootstrap config
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(require 'init-utils)
(require 'init-site-lisp) ;; Must come before elpa, as it may provide package.el
(require 'init-elpa)

;; Load configs for specific features and modes
(require-package 'wgrep)

(require 'init-gui-frames)
(require 'init-grep)
(require 'init-uniquify)
(require 'init-ibuffer)
(require 'init-flycheck)

(require 'init-smex)
(require 'init-ivy)
(require 'init-hippie-expand)
(require 'init-company)
(require 'init-fonts)

(require 'init-editing-utils)

(require 'init-vc)
(require 'init-darcs)
(require 'init-git)

;;(require 'init-projectile)

(require 'init-compile)
(require 'init-textile)
(require 'init-markdown)
(require 'init-csv)
(require 'init-javascript)
(require 'init-php)
(require 'init-org)
(require 'init-html)
(require 'init-css)
(require 'init-python-mode)

(require 'init-lisp)
(require 'init-slime)
(require 'init-common-lisp)

(require 'init-misc)
(require 'init-keybindings)
(require 'mode-line)
(require 'init-notmuch)
(require 'init-easy-hugo)
(require 'init-evil)

;; Extra packages which don't require any configuration

(require-package 'gnuplot)
(require-package 'lua-mode)
(require-package 'htmlize)
(require-package 'dsvn)

;; Allow access from emacsclient
(require 'server)
(unless (server-running-p)
  (server-start))

;; Variables configured via the interactive 'customize' interface
(when (file-exists-p custom-file)
  (load custom-file))

(provide 'init)
;;; init.el ends here
