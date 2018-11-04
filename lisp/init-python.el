(require-package 'elpy)
(elpy-enable)
;;(elpy-use-ipython)

(require-package 'ein)
(require 'ein)
(require 'ein-loaddefs)
(require 'ein-notebook)
(require 'ein-subpackages)

(setq indent-tabs-mode t)
(setq python-indent 4)

(provide 'init-python)
