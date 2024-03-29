
(use-package org :ensure t :defer t
  :init
  (add-hook 'org-mode-hook (lambda()
			     (auto-fill-mode t)
			     (set-input-method 'pyim)
			     (setq-local electric-pair-inhibit-predicate
					 `(lambda(c)
					    (if (char-equal c ?\<) t
					      (,electric-pair-inhibit-predicate c))))))
  :config
  (setq org-src-fontify-natively t
	org-hide-leading-stars t
	x-underline-at-descent-line t)
  (setq org-directory "~/Org")
  (setq org-agenda-files (list
			  (concat org-directory "/Diary/gtd.org")
			  (concat org-directory "/Diary/work.org")))
  (setq org-todo-keywords
	'((sequence "TODO(t)" "PENDING(p)" "|" "CANCEL(c)" "DONE(d)")))
  (setq org-todo-keyword-faces '(("CANCEL" :foreground "maroon" :weight bold)
				 ("PENDING" :foreground "tomato" :weight bold)))
  (setq org-capture-templates
	'(("d" "Diary" entry (file+datetree
			      (lambda()
				(concat org-directory "/Diary/"
					(format-time-string "%Y.org.gpg")))) "* %?")
          ("t" "Todo" entry (file+headline
			     (lambda()
			       (concat org-directory "/Diary/gtd.org")) "Todo List") "* TODO %?")
	  ("w" "Work" entry (file+headline
			     (lambda()
			       (concat org-directory "/Diary/work.org")) "Work List") "* TODO %? :work:\n%U\n")))
  (with-eval-after-load 'org
    (org-babel-do-load-languages
     'org-babel-load-languages
     '((emacs-lisp . t)
       (shell . t)
       (C . t)
       (python . t)))

    (push '("conf-unix" . conf-unix) org-src-lang-modes)

    (require 'org-tempo)
    (add-to-list 'org-structure-template-alist '("sh" . "src shell"))
    (add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
    (add-to-list 'org-structure-template-alist '("py" . "src python")))

  :bind
  ("C-c a" . org-agenda)
  ("C-c l" . org-store-link)
  ("C-c c" . org-capture))

;; org-roam
(use-package org-roam :ensure t :defer t
  :custom
  (org-roam-directory (concat org-directory "/RoamNotes/"))

  :bind
  (("C-c n l" . org-roam-buffer-toggle)
   ("C-c n f" . org-roam-node-find)
   ("C-c n i" . org-roam-node-insert)
   ("C-c n c" . org-roam-capture)
   ("C-c n u" . org-roam-ui-mode))

  :config
  (org-roam-setup)
  (org-roam-db-autosync-mode))

;; Creating the property "type" on my nodes
;; Ref: https://jethrokuan.github.io/org-roam-guide
(require 'org-roam-node)
(cl-defmethod org-roam-node-type ((node org-roam-node))
  "Return the TYPE of NODE."
  (condition-case nil
      (file-name-nondirectory
       (directory-file-name
	(file-name-directory
	 (file-relative-name (org-roam-node-file node) org-roam-directory))))
    (error "")))

;; Modifying the display template to show the node "type"
(setq org-roam-node-display-template
      (concat "${type:15} ${title:*} " (propertize "${tags:10}" 'face 'org-tag)))

(setq org-roam-capture-templates
      '(("m" "main" plain "%?"
	 :if-new (file+head "main/${slug}.org"
			    "#+title: ${title}\n")
	 :immediate-finish t
	 :unnarrowed t)
	("r" "reference" plain "%?"
	 :if-new (file+head "reference/${title}.org"
			    "#+title: ${title}\n")
	 :immediate-finish t
	 :unnarrowed t)))

;; org-roam-ui
(use-package org-roam-ui :ensure t :defer t
  :after org-roam
  :config
  (setq org-roam-ui-sync-theme t
	org-roam-ui-follow t
	org-roam-ui-update-on-save t
	org-roam-ui-open-on-start t))

(provide 'init-org)
