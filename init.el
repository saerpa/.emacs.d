(require 'package)

(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (url (concat (if no-ssl "http" "https") "://melpa.org/packages/")))

  (add-to-list 'package-archives
               '("melpa-stable" . "https://stable.melpa.org/packages/") t))

(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

(package-initialize)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(require 'init-utils)
(require 'init-gui-frames)
(require 'init-grep)
(require 'init-uniquify)
(require 'init-flycheck)
(require 'init-company)
(require 'init-editing-utils)
(require 'init-git)
(require 'init-org)
(require 'init-misc)
(require 'mode-line)
(require 'init-easy-hugo)
(require 'init-evil)
