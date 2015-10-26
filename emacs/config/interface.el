;;; ~/.emacs.d/config/interface.el: UI configuration

;; Theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'sanityinc-solarized-light t)

(defun load-dark ()
  (interactive)
  (load-theme 'sanityinc-solarized-dark t))
(defun load-light ()
  (interactive)
  (load-theme 'sanityinc-solarized-light t))

(global-set-key (kbd "C-c d") 'load-dark)
(global-set-key (kbd "C-c b") 'load-light)

;; Fonts
(set-face-attribute 'default nil ; monospace font: 14pt Inconsolata
                    :font "Inconsolata"
                    :height 140)
(set-face-attribute 'variable-pitch nil ; variable-width: 14pt Helvetica Neue
                    :font "Helvetica Neue"
                    :height 140)

;; Cursor
(set-default 'cursor-type 'bar) ; use a bar cursor (|)
(setq blink-cursor-blinks 0) ; always blink the cursor

;; Scrolling
(setq mouse-wheel-scroll-amount '(1 ((shift) . 4)))
(setq scroll-step 1) ; keyboard scroll one line at a time

;; Window size
(setq default-frame-alist '((fullscreen . maximized)))

;; Line/column numbers
(global-linum-mode t)
(column-number-mode t)

;; Switching between buffers
(require 'ido)
(ido-mode t)
