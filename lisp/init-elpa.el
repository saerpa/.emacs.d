(require 'package)

(let ((local-package-el (locate-library "package")))
  (when (string-match-p (concat "^" (regexp-quote user-emacs-directory))
                        local-package-el)
    (warn "Please remove the local package.el, which is no longer supported (%s)"
          local-package-el)))

;;; Install into separate package dirs for each Emacs version, to prevent bytecode incompatibility
(let ((versioned-package-dir
       (expand-file-name (format "elpa-%s.%s" emacs-major-version emacs-minor-version)
                         user-emacs-directory)))
  (when (file-directory-p package-user-dir)
    (message "Default package locations have changed in this config: renaming old package dir %s to %s."
             package-user-dir
             versioned-package-dir)
    (rename-file package-user-dir versioned-package-dir))
  (setq package-user-dir versioned-package-dir))

;;; Standard package repositories

;; We include the org repository for completeness, but don't normally
;; use it.
;;(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))

;; (defconst sanityinc/no-ssl (and (memq system-type '(windows-nt ms-dos))
;;                                 (not (gnutls-available-p))))

;;; Also use Melpa for most packages
;; (add-to-list 'package-archives
;;              `("melpa" . ,(if sanityinc/no-ssl
;;                               "http://melpa.org/packages/"
;;                             "https://melpa.org/packages/")))
;; NOTE: In case of MELPA problems, the official mirror URL is
;; https://www.mirrorservice.org/sites/stable.melpa.org/packages/

(setq package-archives '(("gnu"   . "http://elpa.zilongshanren.com/gnu/")
			 ("org"   . "http://elpa.zilongshanren.com/org/")
                         ("melpa" . "http://elpa.zilongshanren.com/melpa/")))


(when (not package-archive-contents)
  (package-refresh-contents))

;;; On-demand installation of packages

(defun require-package (package &optional min-version no-refresh)
  "Install given PACKAGE, optionally requiring MIN-VERSION.
If NO-REFRESH is non-nil, the available package lists will not be
re-downloaded in order to locate PACKAGE."
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
        (if (boundp 'package-selected-packages)
            ;; Record this as a package the user installed explicitly
            (package-install package nil)
          (package-install package))
      (progn
        (package-refresh-contents)
        (require-package package min-version t)))))


(defun maybe-require-package (package &optional min-version no-refresh)
  "Try to install PACKAGE, and return non-nil if successful.
In the event of failure, return nil and print a warning message.
Optionally require MIN-VERSION.  If NO-REFRESH is non-nil, the
available package lists will not be re-downloaded in order to
locate PACKAGE."
  (condition-case err
      (require-package package min-version no-refresh)
    (error
     (message "Couldn't install optional package `%s': %S" package err)
     nil)))

(setq package-enable-at-startup nil)
(package-initialize)

(require-package 'fullframe)
(fullframe list-packages quit-window)

(require-package 'cl-lib)
(require 'cl-lib)

(provide 'init-elpa)
