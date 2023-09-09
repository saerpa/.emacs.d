
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'init-elpa)
(require 'init-tools)
(require 'init-read)
(require 'init-edit)
(require 'init-code)
(require 'init-org)
(require 'init-ui)
(require 'init-utils)
(require 'init-misc)

(autoload 'practice-mode "practice")
(setq auto-mode-alist (cons '("\\.cmm\\'" . practice-mode) auto-mode-alist))

(setq calc-settings-file (locate-user-emacs-file "lisp/init-calc.el"))
(when (file-exists-p calc-settings-file)
  (load calc-settings-file))

(setq custom-file (locate-user-emacs-file "lisp/custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))
