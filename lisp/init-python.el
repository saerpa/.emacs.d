(require-package 'elpy)
(elpy-enable)
(elpy-use-ipython)

(require-package 'ein)
(require 'ein)
(require 'ein-loaddefs)
(require 'ein-notebook)
(require 'ein-subpackages)

(require-package 'jedi)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)                 ; optional

(provide 'init-python)
