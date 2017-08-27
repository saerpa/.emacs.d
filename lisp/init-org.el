;; org key bindings
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

;; Various preferences
(setq org-log-done t
      org-log-into-drawer t   ;turn on the drawer
      org-archive-mark-done nil
      org-hide-emphasis-markers t
      org-catch-invisible-edits 'show
      org-export-coding-system 'utf-8
      org-html-validation-link nil
      org-completion-use-ido t
      org-edit-src-content-indentation 0
      org-edit-timestamp-down-means-later t
      org-agenda-start-on-weekday nil
      org-agenda-span 14
      org-agenda-include-diary t
      org-agenda-window-setup 'current-window
      org-fast-tag-selection-single-key 'expert
      org-export-kill-product-buffer-when-displayed t
      org-src-fontify-natively t ;; make source code fancy in the org file
      org-refile-use-outline-path t
      org-refile-allow-creating-parent-nodes 'confirm
      org-tags-column 80
      org-outline-path-complete-in-steps nil
      org-refile-use-cache nil
      org-agenda-inhibit-startup t ;; ~50x speedup
      org-agenda-use-tag-inheritance nil ;; 3-4x speedup
      )

;; Targets include this file and any file contributing to the agenda - up to 5 levels deep
(setq org-refile-targets '((nil :maxlevel . 5) (org-agenda-files :maxlevel . 5)))


;;org-mode中自动换行
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))

;;add org-agenda-files
;;hotkey: C-c [
;;replace your own org files
(setq org-agenda-files (list "~/Documents/Org/"))

(setq org-capture-templates
      '(("t" "todo" entry (file+headline "~/Documents/Org/todo.org" "todo")
	 "* TODO %?\n%U\n" :clock-resume t)
	("d" "diary" entry (file+datetree (concat "~/Documents/.Diary/Org/"(format-time-string "%Y")".org"))
	 "* %?\n写于 %U\n")
	("c" "capture" entry (file+headline "~/Documents/Org/capture.org" "misc")
	 "* %?")
	("n" "note" entry (file "~/Documents/Org/note.org")
         "* %? :NOTE:\n%U\n%a\n" :clock-resume t)
	))

;;add TODO keywords
(setq org-todo-keywords
      '((sequence "TODO(t)" "|" "CANCELED(c@/!)" "DONE(d@)")))

;;set faces for TODO keywords
(setq org-todo-keyword-faces
      '(("TODO" :foreground "red" :weitht bold)
 	("CANCELED" :foreground "Orange" :weight bold)
 	("DONE" :foreground "forest green" :weight bold)))

;;; Agenda views
(setq-default org-agenda-clockreport-parameter-plist '(:link t :maxlevel 3))

(add-hook 'org-agenda-mode-hook 'hl-line-mode)

;; Save clock data and notes in the LOGBOOK drawer
(setq org-clock-into-drawer t)
;; Save state changes in the LOGBOOK drawer
(setq org-log-into-drawer t)
;; Removes clocked tasks with 0:00 duration
(setq org-clock-out-remove-zero-time-clocks t)

;; Show clock sums as hours and minutes, not "n days" etc.
(setq org-time-clocksum-format
      '(:hours "%d" :require-hours t :minutes ":%02d" :require-minutes t))


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
	 :with-toc t
	 :table-of-contents nil
	 :html-head "<link rel=\"stylesheet\" type=\"text/css\" href=\"css/org.css\" />"
	 :html-head-extra  "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\" />"
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
	 :base-directory "~/Documents/.Diary/Org/"
	 :base-extension "org"
	 :publishing-directory "~/Documents/.Diary/Html/Org-html/"
	 :recursive t
	 :publishing-function org-html-publish-to-html
	 :headline-levels 4 ;just the default for this project
	 :section-numbers nil
	 :author "saerpa"
	 :email "saerpa@163.com"
	 :html-head "<link rel=\"stylesheet\" type=\"text/css\" href=\"css/org.css\" />"
	 :auto-sitemap t ;gentrate sitemap.org automagically...
	 :sitemap-filename "sitemap.org" ;...call it sitemap.org (it's the default)...
	 :sitemap-title "Sitemap" ;... with title 'Sitemap'
	 :sitemap-sort-files alphabetically
	 :sitemap-file-entry-format "Diary ㊙ %t"
	 :auto-preamble t)
 	("diary-static"
 	 :base-directory "~/Documents/.Diary/Org/img/"
 	 :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
 	 :publishing-directory "~/Documents/.Diary/Html/Org-html/img/"
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
   (ditaa . t)
   (plantuml . t)
   (dot . t)
   (python . t)))

;; org mode do not prompt me
;;(setq org-confirm-babel-evaluate nil)

(provide 'init-org)
