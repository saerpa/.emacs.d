;; initial window settings
;;(setq initial-frame-alist
;;      '((background-color . "honeydew")))
;; subsequent window settings
;;(setq default-frame-alist
;;      '((background-color . "honeydew")))

(setq initial-frame-alist (quote ((fullscreen . maximized))))
(setq frame-title-format "%b")
(setq pop-up-frames nil) ; t for true, nil for false
(tool-bar-mode -1) ;关闭工具栏
(scroll-bar-mode -1) ;关闭文件滑动控件
(global-linum-mode 1) ;显示行号
(global-hl-line-mode -1) ;是否高亮当前行
(blink-cursor-mode -1) ;光标禁止闪烁
;;(setq-default cursor-type 'bar) ;更改光标的样式
(window-numbering-mode 1)
;; specify font for all unicode characters
(when (member "Symbola" (font-family-list))
  (set-fontset-font t 'unicode "Symbola" nil 'prepend))

(provide 'init-ui)
