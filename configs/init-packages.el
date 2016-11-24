;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(require 'package)
(setq package-archives '(("gnu"   . "http://elpa.zilongshanren.com/gnu/")
                         ("melpa" . "http://elpa.zilongshanren.com/melpa/")))
;;(add-to-list 'package-archives
;;             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
  '(
  ;company
  ;magit
  ;yasnippet
  ;iedit
  ;elpy
  ;ein
  ;py-autopep8
  ;flycheck
   ))

(mapc #'(lambda(package)
	  (unless (package-installed-p package)
	    (package-install package)))
      myPackages)
;; 快速打开配置文件
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;; 缩进buffer
(defun indent-buffer()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer()
  (interactive)
  (save-excursion
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "Indent selected region."))
      (progn
	(indent-buffer)
	(message "Indent buffer."))
      )))

(defun hidden-dos-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (unless buffer-display-table
    (setq buffer-display-table (make-display-table)))
  (aset buffer-display-table ?\^M []))

(defun remove-dos-eol ()
  "Replace DOS eolns CR LF with Unix eolns CR"
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match "")))

(defadvice show-paren-function (around fix-show-paren-function activate)
  (cond ((looking-at-p "\\s(") ad-do-it)
	(t (save-excursion
	     (ignore-errors (backward-up-list))
	     ad-do-it))));光标在括号内时高亮两边的括号



(show-paren-mode 1)
(electric-pair-mode 1) ;auto close bracket insertion
(delete-selection-mode 1)
(global-auto-revert-mode 1) ;自动加载外部修改过的文件

(require 'recentf) ;enable recentf-mode
(recentf-mode 1)

;;(global-company-mode 1) ;enable company
;;(yas-global-mode 1) ;enable yas-global-mode
;;(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
;;
;;(add-to-list 'load-path "~/.emacs.d/elpa/web-mode")
;;(require 'web-mode)
;;(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))

(setq auto-mode-alist (append '(("/tmp/mutt.*" . mail-mode)) auto-mode-alist)) ; Mutt support.


;;(ivy-mode 1) ;swiper 
;;(setq ivy-use-virtual-buffers t)

;; turn on abbrev mode globally
(setq-default abbrev-mode t)

;; emms
;;(add-to-list 'load-path "~/.emacs.d/elpa/emms-20160801.1349")
;;(require 'emms-setup)
;;(emms-all)
;;(emms-default-players)
;;(setq emms-source-file-default-directory "~/Music/")

;;(elpy-enable)
;;(when (require 'flycheck nil t)
;;  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
;;  (add-hook 'elpy-mode-hook 'flycheck-mode))
;;
;;(elpy-use-ipython)
;;
;;(add-to-list 'load-path "~/.emacs.d/elpa/ace-jump-mode-20140616.115")
;;(autoload
;;  'ace-jump-mode
;;  "ace-jump-mode"
;;  "Emacs quick move minor mode"
;;  t)
;;
;;(ace-pinyin-global-mode +1)
;;(setq ace-pinyin-use-avy nil)
;;(setq ace-pinyin-simplified-chinese-only-p nil)
;(setq ace-pinyin-enable-punctuation-translation nil)

;;(require 'ein)

;;(require 'py-autopep8)
;;(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

