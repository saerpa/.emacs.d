(require 'package)

(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                         ("melpa" . "http://elpa.emacs-china.org/melpa/")))

;; (setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
;;                          ("marmalade" . "https://marmalade-repo.org/packages/")
;;                          ("melpa" . "https://melpa.org/packages/")))

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t) ; Org-mode's repository


(package-initialize)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(require 'init-utils)
;(require 'init-python)
(require 'init-gui-frames)
(require 'init-ivy)
(require 'init-grep)
(require 'init-uniquify)
(require 'init-flycheck)
(require 'init-company)
(require 'init-editing-utils)
(require 'init-git)
(require 'init-org)
(require 'init-misc)
(require 'mode-line)
(require 'init-evil)
(require 'init-easy-hugo)
(require 'init-deft)
