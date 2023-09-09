
(use-package package
  :config
  (setq package-archives '(("gnu" . "https://mirrors.ustc.edu.cn/elpa/gnu/")
                           ("melpa" . "https://mirrors.ustc.edu.cn/elpa/melpa/")
                           ("nongnu" . "https://mirrors.ustc.edu.cn/elpa/nongnu/")))

  (unless (bound-and-true-p package--initialized)
    (package-initialize)))

(unless package-archive-contents
  (package-refresh-contents))

(provide 'init-elpa)
