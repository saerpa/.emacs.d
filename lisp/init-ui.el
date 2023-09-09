
(setq inhibit-startup-message t)
(setq visible-bell t)
(setq use-dialog-box nil)

(tool-bar-mode -1)
(menu-bar-mode t)
(toggle-frame-maximized)

;; Display time in mode line
(setq display-time-format "[%a|%I:%M%p]"
      display-time-default-load-average nil
      display-time-day-and-date t)
(display-time-mode t)

(provide 'init-ui)
