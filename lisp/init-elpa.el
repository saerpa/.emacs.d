;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(require 'package)

(setq package-archives '(("gnu"   . "http://elpa.zilongshanren.com/gnu/")
			 ("org"   . "http://elpa.zilongshanren.com/org/")
                         ("melpa" . "http://elpa.zilongshanren.com/melpa/")))

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar MyPackages
  '(
    helm
    company
    company-statistics
    neotree
    magit
    yasnippet
    iedit
    expand-region
    window-numbering
    flycheck
    ace-jump-mode
    indent-guide
    notmuch
    evil
    elpy
    ein
    py-autopep8
    plantuml-mode
    rainbow-delimiters
    markdown-mode
    ;; ivy
    ;; swiper
    ))

(mapc #'(lambda(package)
	  (unless (package-installed-p package)
	    (package-install package)))
      MyPackages)

(provide 'init-elpa)
