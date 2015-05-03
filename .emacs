;; Packages
(require 'package)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("marmlade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/pkg")

;; Themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'monokai t)

;; Fonts
(set-face-attribute 'default nil :font "Inconsolata" :height 140)
(set-face-attribute 'variable-pitch nil :font "Helvetica Neue" :height 140)

;; Load things
(load "mine-sweeper")
(load "two-mode-mode")

;; Turn on modes
(add-hook 'text-mode-hook 'electric-pair-mode)
(electric-pair-mode t)
(global-linum-mode t)
;;(turn-on-follow-mouse)

;; LaTeX
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)

(setq TeX-PDF-mode t)

;; Asymptote
(add-to-list 'load-path "/usr/local/share/asymptote")
(autoload 'asy-mode "asy-mode.el" "Asymptote major mode." t)
(autoload 'lasy-mode "asy-mode.el" "hybrid Asymptote/Latex major mode." t)
(autoload 'asy-insinuate-latex "asy-mode.el" "Asymptote insinuate LaTeX." t)
(add-to-list 'auto-mode-alist '("\\.asy$" . asy-mode))

;; Variables
(setq temporary-file-directory "~/tmp/emacs")
(setq TeX-PDF-mode t)

;; Save backup and autosave files to temporary-file-directory, not the current directory
(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

(setq frame-background-mode (quote automatic))

;; Hooks
(add-hook 'doc-view-mode-hook 'auto-revert-mode)
(setq doc-view-continuous t)

