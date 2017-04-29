(require-package 'org-fstree)

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
      org-src-fontify-natively t ;make source code fancy in the org file
      org-refile-use-outline-path t
      org-refile-allow-creating-parent-nodes 'confirm
      org-tags-column 80
      org-outline-path-complete-in-steps nil
      org-refile-use-cache nil
      org-agenda-inhibit-startup t ;; ~50x speedup
      org-agenda-use-tag-inheritance nil ;; 3-4x speedup
      )
					; Targets include this file and any file contributing to the agenda - up to 5 levels deep
(setq org-refile-targets '((nil :maxlevel . 5) (org-agenda-files :maxlevel . 5)))

(after-load 'org-agenda
	    (add-to-list 'org-agenda-after-show-hook 'org-show-entry))

;; Lots of stuff from http://doc.norang.ca/org-mode.html

(setq org-ditta-jar-path (expand-file-name "/usr/share/emacs/24.4/lisp/contrib/scripts/ditaa.jar"))
(setq org-plantuml-jar-path (expand-file-name "/usr/share/emacs/24.4/lisp/contrib/scripts/plantuml.jar"))
(defun sanityinc/grab-ditaa (url jar-name)
  "Download URL and extract JAR-NAME as `org-ditaa-jar-path'."
  ;; TODO: handle errors
  (message "Grabbing " jar-name " for org.")
  (let ((zip-temp (make-temp-name "emacs-ditaa")))
    (unwind-protect
        (progn
          (when (executable-find "unzip")
            (url-copy-file url zip-temp)
            (shell-command (concat "unzip -p " (shell-quote-argument zip-temp)
                                   " " (shell-quote-argument jar-name) " > "
                                   (shell-quote-argument org-ditaa-jar-path)))))
      (when (file-exists-p zip-temp)
        (delete-file zip-temp)))))

(after-load 'ob-ditaa
	    (unless (and (boundp 'org-ditaa-jar-path)
			 (file-exists-p org-ditaa-jar-path))
	      (let ((jar-name "ditaa0_9.jar")
		    (url "http://jaist.dl.sourceforge.net/project/ditaa/ditaa/0.9/ditaa0_9.zip"))
		(setq org-ditaa-jar-path (expand-file-name jar-name (file-name-directory user-init-file)))
		(unless (file-exists-p org-ditaa-jar-path)
		  (sanityinc/grab-ditaa url jar-name)))))

;;org-mode中自动换行
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))

;;add org-agenda-files
;;hotkey: C-c [
;;replace your own org files
(setq org-agenda-files (list "~/Documents/Org/"))

(setq org-capture-templates
      '(("t" "todo" entry (file+headline "~/Documents/Org/todo.org" "todo")
	 "* TODO %?\n%U\n" :clock-resume t)
	("d" "Diary" entry (file+datetree (concat "~/Documents/Org/.Diary/" (format-time-string "%Y") ".org"))
	 "* %?\n写于 %U\n %i\n %a")
	("c" "Capture" entry (file+headline "~/Documents/Org/capture.org" "misc")
	 "* %?")
	("n" "note" entry (file "~/Documents/Org/note.org")
         "* %? :NOTE:\n%U\n%a\n" :clock-resume t)
	))

;;add TODO keywords
(setq org-todo-keywords
      '((sequence "TODO(t)" "|" "CANCELED(c@/!)" "DONE(d@)")))

;;set faces for TODO keywords
;; (setq org-todo-keyword-faces
;;       '(("TODO" :foreground "red" :weitht bold)
;; 	("CANCELED" :foreground "Orange" :weight bold)
;; 	("DONE" :foreground "forest green" :weight bold)))

;;; Agenda views
(setq-default org-agenda-clockreport-parameter-plist '(:link t :maxlevel 3))

(add-hook 'org-agenda-mode-hook 'hl-line-mode)

;;; Org clock

;; Save the running clock and all clock history when exiting Emacs, load it on startup
(after-load 'org
  (org-clock-persistence-insinuate))
(setq org-clock-persist t)
(setq org-clock-in-resume t)

;; Save clock data and notes in the LOGBOOK drawer
(setq org-clock-into-drawer t)
;; Save state changes in the LOGBOOK drawer
(setq org-log-into-drawer t)
;; Removes clocked tasks with 0:00 duration
(setq org-clock-out-remove-zero-time-clocks t)

;; Show clock sums as hours and minutes, not "n days" etc.
(setq org-time-clocksum-format
      '(:hours "%d" :require-hours t :minutes ":%02d" :require-minutes t))


;;; Show the clocked-in task - if any - in the header line
(defun sanityinc/show-org-clock-in-header-line ()
  (setq-default header-line-format '((" " org-mode-line-string " "))))

(defun sanityinc/hide-org-clock-from-header-line ()
  (setq-default header-line-format nil))

(add-hook 'org-clock-in-hook 'sanityinc/show-org-clock-in-header-line)
(add-hook 'org-clock-out-hook 'sanityinc/hide-org-clock-from-header-line)
(add-hook 'org-clock-cancel-hook 'sanityinc/hide-org-clock-from-header-line)

(after-load 'org-clock
  (define-key org-clock-mode-line-map [header-line mouse-2] 'org-clock-goto)
  (define-key org-clock-mode-line-map [header-line mouse-1] 'org-clock-menu))

;; Remove empty LOGBOOK drawers on clock out
(defun sanityinc/remove-empty-drawer-on-clock-out ()
  (interactive)
  (save-excursion
    (beginning-of-line 0)
    (org-remove-empty-drawer-at "LOGBOOK" (point))))

(after-load 'org-clock
  (add-hook 'org-clock-out-hook 'sanityinc/remove-empty-drawer-on-clock-out 'append))
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
	 :base-directory "~/Documents/Org/.Diary/"
	 :base-extension "org"
	 :publishing-directory "~/Documents/Org/.Diary/html/"
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
   (ditaa . t)
   (plantuml . t)
   (dot . t)
   (python . t)))


;; org mode do not prompt me
(setq org-confirm-babel-evaluate nil)

(provide 'init-org)
