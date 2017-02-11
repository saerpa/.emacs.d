;; org key bindings
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

;; Various preferences
(setq org-log-done t
      org-log-into-drawer t   ;turn on the drawer
      org-completion-use-ido t
      org-edit-src-content-indentation 0
      org-edit-timestamp-down-means-later t
      org-agenda-start-on-weekday nil
      org-agenda-span 14
      org-agenda-include-diary t
      org-agenda-window-setup 'current-window
      org-fast-tag-selection-single-key 'expert
      org-export-kill-product-buffer-when-displayed t
      org-src-fontify-natively t ;make source code fancy in the org file
      org-tags-column 80
      org-agenda-inhibit-startup t ;; ~50x speedup
      org-agenda-use-tag-inheritance nil ;; 3-4x speedup
      )

;;org-mode中自动换行
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))

;;add org-agenda-files
;;hotkey: C-c [
;;replace your own org files
(setq org-agenda-files (list "~/Documents/Org/"))

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/Documents/Org/todo.org" "Tasks")
	 "* TODO %?\n %i\n %a")
	("d" "Diary" entry (file+datetree (concat "~/Documents/Org/.Diary/" (format-time-string "%Y") ".org"))
	 "* %?\n写于 %U\n %i\n %a")
	("p" "Pieces" entry (file+headline "~/Documents/Org/capture.org" "Later")
	 "* %?")))

;;add TODO keywords
(setq org-todo-keywords
      '((sequence "TODO(t)" "|" "CANCELED(c@/!)" "DONE(d@)")))

;;set faces for TODO keywords
(setq org-todo-keyword-faces
      '(("TODO" :foreground "red" :weitht bold)
	("CANCELED" :foreground "Orange" :weight bold)
	("DONE" :foreground "forest green" :weight bold)))

;;set level face
;;(set-face-attribute 'org-level-1 nil :height 1.2 :bold t)
;;(set-face-attribute 'org-level-2 nil :height 1.1 :bold t)
;;(set-face-attribute 'org-level-3 nil :height 1.1 :bold t)
;;(set-face-attribute 'org-level-4 nil :height 1.1 :bold t)

;;using org-mime to email
;;(require 'org-mime)

;;org publish
(require 'ox-publish)
(setq org-publish-project-alist
      '(("blog-notes"
	 :base-directory "~/saerpa.github.io/org/"
	 :base-extension "org"
	 :publishing-directory "~/saerpa.github.io/"
	 :recursive t
	 :publishing-function org-html-publish-to-html
	 :headline-levels 4 ;just the default for this project
	 :section-numbers nil
	 :author "saerpa"
	 :email "saerpa@163.com"
	 :export-author-info nil
	 :export-creator-info nil
	 :table-of-contents nil
	 :html-head "<link rel=\"stylesheet\" type=\"text/css\" href=\"css/worg-classic.css\" />"
	 :html-postamble "<p class=\"date\">Updated last: %C</p>"
	 :auto-sitemap t ;gentrate sitemap.org automagically...
	 :sitemap-filename "sitemap.org" ;...call it sitemap.org (it's the default)...
	 :sitemap-title "Sitemap" ;... with title 'Sitemap'
	 :sitemap-sort-files anti-chronologically
	 :sitemap-file-entry-format "%d 🍀 %t"
	 :auto-preamble t)

	;;	("blog-static"
	;;	 :base-directory "~/saerpa.github.io/img/"
	;;	 :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
	;;	 :publishing-directory "~/saerpa.github.io/img/"
	;;	 :recursive t
	;;	 :publishing-function org-publish-attachment)

	("diary-notes"
	 :base-directory "~/Documents/Org/.Diary/"
	 :base-extension "org"
	 :publishing-directory "~/Documents/Org/.Diary/html/"
	 :recursive t
	 :publishing-function org-html-publish-to-html
	 :headline-levels 4 ;just the default for this project
	 :section-numbers nil
	 :author "saerpa"
	 :email "saerpa@163.com"
	 :html-head "<link rel=\"stylesheet\" type=\"text/css\" href=\"css/worg-classic.css\" />"
	 :auto-sitemap t ;gentrate sitemap.org automagically...
	 :sitemap-filename "sitemap.org" ;...call it sitemap.org (it's the default)...
	 :sitemap-title "Sitemap" ;... with title 'Sitemap'
	 :sitemap-sort-files alphabetically
	 :sitemap-file-entry-format "%d ㊙ %t"
	 :auto-preamble t)
 	("diary-static"
 	 :base-directory "~/Documents/Org/.Diary/img/"
 	 :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
 	 :publishing-directory "~/Documents/Org/.Diary/html/img/"
 	 :recursive t
 	 :publishing-function org-publish-attachment)
	
	;;	("blog" :components("blog-notes" "blog-static"))
	("diary" :components("diary-notes" "diary-static"))
	))

;; active Babel languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (C . t)
   (sh . t)
   (latex . t)
   (python . t)))

(provide 'init-org)
