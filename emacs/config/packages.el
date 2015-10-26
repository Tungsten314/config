;;; ~/.emacs.d/config/packages.el: package management settings

(require 'package)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/pkg")

(setq auto-package-update-interval 2)
(auto-package-update-maybe) ; Update packages every other day
