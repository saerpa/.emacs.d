
;; ========== Initialize package sources ==========
(require 'package)

(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
			 ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; ========== Packages install ==========
;; (use-package rainbow-delimiters
;;   :hook (prog-mode . rainbow-delimiters-mode))

;; (use-package expand-region
;;   :bind ("C-x =" . er/expand-region))

;; (use-package keycast
;;   :config
;;   (keycast-mode t))
(use-package counsel
  :custom
  (counsel-linux-app-format-function #'counsel-linux-app-format-function-name-only)
  :config
  (counsel-mode 1))

(use-package ivy
  :diminish
  :bind (("C-s" . swiper))
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) "))

(use-package ivy-rich
  :after ivy
  :init
  (ivy-rich-mode 1))

(use-package projectile
  :config
  (projectile-mode +1))

;; (use-package avy
;;   :bind ("C-x ;" . avy-goto-char))

;; (use-package magit
;;   :commands magit-status
;;   :custom
;;   (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

;; NOTE: Make sure to configure a GitHub token before using this package!
;; - https://magit.vc/manual/forge/Token-Creation.html#Token-Creation
;; - https://magit.vc/manual/ghub/Getting-Started.html#Getting-Started
;;(use-package forge
;;  :after magit)

;; ========== Org settings ==========
(use-package org
  :config
  (setq org-src-fontify-natively t)
  (setq org-confirm-babel-evaluate nil))

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

;; ========== Misc settings ==========
;; (global-set-key (kbd "C-x SPC") 'set-mark-command)
(setq inhibit-startup-message t)
;; (setq make-backup-files nil)
(tool-bar-mode 0)
(menu-bar-mode 0)
(show-paren-mode t)
(global-hl-line-mode t)
(load-theme 'manoj-dark)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-hide-leading-stars t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
