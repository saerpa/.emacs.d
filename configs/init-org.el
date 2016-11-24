(with-eval-after-load 'org 

;;  (require 'org-mime)
  

  ;; make source code fancy in the org file
  (setq org-src-fontify-natively t)

  ;;org-mode中自动换行
  (add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))

  ;;add org-agenda-files 
  ;;hotkey: C-c [ 
  ;;replace your own org files
  (setq org-agenda-files (list "~/Documents/Org/"))

  ;;turn on the drawer
  (setq org-log-into-drawer t)

  (setq org-capture-templates
	'(("t" "Todo" entry (file+headline "~/Documents/Org/todo.org" "Tasks")
	   "* TODO %?\n %i\n %a")
	  ("d" "Diary" entry (file+datetree "~/Documents/Org/.Diary/2016.org")
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
  (set-face-attribute 'org-level-1 nil :height 1.2 :bold t)
  (set-face-attribute 'org-level-2 nil :height 1.1 :bold t)
;  (set-face-attribute 'org-level-3 nil :height 1.2 :bold t)
 ; (set-face-attribute 'org-level-4 nil :height 1.1 :bold t)

)
