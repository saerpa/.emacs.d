
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
(require 'init-pyim)
(require 'init-which-key)
(require 'init-cscope)
(require 'init-semantic)
(require 'init-eglot)
(require 'init-pangu-spacing)
(require 'init-epa-file)
(require 'init-ace-window)
(require 'init-misc)

(autoload 'practice-mode "practice")
(setq auto-mode-alist (cons '("\\.cmm\\'" . practice-mode) auto-mode-alist))

(setq custom-file (locate-user-emacs-file "lisp/init-custom.el"))
(load custom-file 'noerror 'nomessage)
