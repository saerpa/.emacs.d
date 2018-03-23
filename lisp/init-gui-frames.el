;; Suppress GUI features
(setq use-file-dialog nil)
(setq use-dialog-box nil)
(setq inhibit-startup-screen t)
(setq inhibit-startup-echo-area-message t)

(setq indicate-empty-lines t) ;;Show a marker in the left fringe for lines not in the buffer

;; Window size and features
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'set-scroll-bar-mode)
  (set-scroll-bar-mode nil))

(let ((no-border '(internal-border-width . 0)))
  (add-to-list 'default-frame-alist no-border)
  (add-to-list 'initial-frame-alist no-border))

;; initial window settings
;;(setq initial-frame-alist
;;      '((background-color . "honeydew")))
;; subsequent window settings
;;(setq default-frame-alist
;;      '((background-color . "honeydew")))

(setq initial-frame-alist (quote ((fullscreen . maximized))))
(setq frame-title-format "%b")
(global-linum-mode 1)
(global-hl-line-mode -1)

(require-package 'window-numbering)
(window-numbering-mode 1)

;; Non-zero values for `line-spacing' can mess up ansi-term and co, so we zero it explicitly in those cases.
(add-hook 'term-mode-hook
          (lambda ()
            (setq line-spacing 0)))

(provide 'init-gui-frames)
