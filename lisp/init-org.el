
(use-package org
  :config
  (setq org-src-fontify-natively t)
  (setq org-confirm-babel-evaluate nil)
  (setq org-hide-leading-stars t))

(setq my-org-file-root-dir "~/Org/")
(setq org-agenda-files (list (concat my-org-file-root-dir "Diary/")))
(setq org-capture-templates
      '(("d" "Diary" entry (file+datetree (lambda() (concat my-org-file-root-dir "/Diary/" (format-time-string "%Y.org.gpg"))))
	 "* %?\n%U")
        ("t" "Todo" entry (file+headline (lambda() (concat my-org-file-root-dir "Diary/Todo.org.gpg")) "Todo List")
	 "* TODO %?")))

(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)

(add-hook 'org-mode-hook (lambda() (auto-fill-mode t)))

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

;; org-roam
(use-package org-roam
  :custom
  (org-roam-directory "~/Org/RoamNotes/")
  :bind
  (("C-c n l" . org-roam-buffer-toggle)
   ("C-c n f" . org-roam-node-find)
   ("C-c n i" . org-roam-node-insert)
   ("C-c n c" . org-roam-capture))
  :config
  (org-roam-setup)
  (org-roam-db-autosync-mode))

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

;; Creating the property "type" on my nodes
;; Ref: https://jethrokuan.github.io/org-roam-guide
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

(provide 'init-org)
