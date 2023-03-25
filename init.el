
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'init-elpa)
(require 'init-use-package)
(require 'init-vertico)
(require 'init-orderless)
(require 'init-marginalia)
(require 'init-embark)
(require 'init-consult)
(require 'init-org)
(require 'init-magit)
(require 'init-company)
(require 'init-projectile)
(require 'init-misc)

(setq custom-file (expand-file-name "lisp/init-custom.el" user-emacs-directory))
(load custom-file)
