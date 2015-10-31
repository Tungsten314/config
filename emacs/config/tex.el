;;; ~/.emacs.d/config/tex.el: settings for TeX and Asymptote

;; TeX
(setq TeX-auto-save t)
(setq TeX-parse-self t)

(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'auto-fill-mode)
(add-hook 'LaTeX-mode-hook (lambda ()
                             (add-to-list 'write-file-functions
                                          'delete-trailing-whitespace)))

(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)

(setq TeX-PDF-mode t)

;; Softwrap
(add-hook 'LaTeX-mode-hook (lambda () (setq truncate-lines nil)))

;; Key bindings
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
  (local-set-key "\C-ct" 'tex-typewriter)
  (local-set-key "\C-cl" "\\left(")
  (local-set-key "\C-cr" "\\right)"))

(add-hook 'LaTeX-mode-hook 'tex-bindings-hook)

;; Autocomplete
(add-to-list 'ac-modes 'latex-mode)   ; make auto-complete aware of `latex-mode`

(defun ac-latex-mode-setup ()         ; add ac-sources to default ac-sources
  (setq ac-sources
     (append '(ac-source-math-unicode ac-source-math-latex ac-source-latex-commands)
               ac-sources)))

(add-hook 'TeX-mode-hook 'ac-latex-mode-setup)

;; Asymptote
(add-to-list 'load-path "/usr/local/share/asymptote")
(autoload 'asy-mode "asy-mode.el" "Asymptote major mode." t)
(autoload 'lasy-mode "asy-mode.el" "hybrid Asymptote/Latex major mode." t)
(autoload 'asy-insinuate-latex "asy-mode.el" "Asymptote insinuate LaTeX." t)
(add-to-list 'auto-mode-alist '("\\.asy$" . asy-mode))
