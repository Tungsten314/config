;; Packages
(require 'package)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
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

;; Scrolling
(setq mouse-wheel-scroll-amount '(1 ((shift) . 4))) ;; one line at a time
(setq scroll-step 1) ;; keyboard scroll one line at a time

;; Indentation
(setq-default indent-tabs-mode nil)
(setq tab-width 4)
(defvaralias 'c-basic-offset 'tab-width)
(defvaralias 'cperl-indent-level 'tab-width)
(defvaralias 'python-indent 'tab-width)

;; $PATH
(setq exec-path (append exec-path '("/usr/local/bin")))
(setenv "PATH"
         (concat
          "/usr/texbin" ":"
          (getenv "PATH")))

;; Turn on modes
(delete-selection-mode t)
(global-hl-line-mode t)
(require 'zone) (zone-when-idle 180)
(tool-bar-mode -1)

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

;; Spellchecking
(setq-default ispell-program-name "/usr/local/bin/aspell")
(setq ispell-dictionary "en_CA")
(add-hook 'LaTeX-mode-hook 'flyspell-mode)

;; LaTeX
(setq TeX-auto-save t)
(setq TeX-parse-self t)

(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook (lambda ()
                             (add-to-list 'write-file-functions
                                          'delete-trailing-whitespace)))

(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)

(setq TeX-PDF-mode t)

;; Change keybindings for (La)TeX fonts
(defun tex-bold ()
  (interactive)
  (TeX-font nil ?\C-b))

(defun tex-italic ()
  (interactive)
  (TeX-font nil ?\C-e))

(defun tex-smallcaps ()
  (interactive)
  (TeX-font nil ?\C-c))

(defun tex-typewriter ()
  (interactive)
  (TeX-font nil ?\C-t))

(defun tex-bindings-hook ()
  (local-set-key "\C-cb" 'tex-bold)
  (local-set-key "\C-ci" 'tex-italic)
  (local-set-key "\C-cs" 'tex-smallcaps)
  (local-set-key "\C-ct" 'tex-typewriter))

(add-hook 'LaTeX-mode-hook 'tex-bindings-hook)

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
