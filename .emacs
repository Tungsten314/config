;; Packages
(require 'package)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("marmlade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/pkg")

;; Load things
(load "mine-sweeper")
(load "two-mode-mode")

;; Themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'sanityinc-solarized-dark t)

;; Fonts
(set-face-attribute 'default nil
                    :font "Inconsolata"
                    :height 140)
(set-face-attribute 'variable-pitch nil
                    :font "Helvetica Neue"
                    :height 140)

;; Cursor
(set-default 'cursor-type 'bar)
(setq blink-cursor-blinks 0)

;; Indentation
(setq-default indent-tabs-mode nil)
(setq tab-width 4)
(defvaralias 'c-basic-offset 'tab-width)
(defvaralias 'cperl-indent-level 'tab-width)

;; Turn on modes
(add-hook 'text-mode-hook 'electric-pair-mode)
(delete-selection-mode t)
(global-hl-line-mode t)
(require 'zone) (zone-when-idle 120)

;; Window size
(setq default-frame-alist '((fullscreen . maximized)))

;; Line/column numbers
(global-linum-mode t)
(column-number-mode t)

;; Parentheses
(electric-pair-mode t)
(show-paren-mode t)
(setq show-paren-delay 0)
(set-face-attribute 'show-paren-match-face nil
                    :foreground "#268bd2"
                    :inverse-video nil
                    :underline t)
(set-face-attribute 'show-paren-mismatch-face nil
                    :foreground "#839496"
                    :background "#dc322f"
                    :inverse-video nil)

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

;; Lisp
(setq inferior-lisp-program "/usr/local/bin/sbcl")

;; Save backup and autosave files to temporary-file-directory, not the current directory
(setq temporary-file-directory "~/tmp/emacs")
(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

;; doc-view-mode
(add-hook 'doc-view-mode-hook 'auto-revert-mode)
(setq doc-view-continuous t)

