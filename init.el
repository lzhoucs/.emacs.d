(package-initialize)

;; csharp-mode workaround. https://github.com/josteink/csharp-mode/pull/50
;; (require 'cl)

;; package archive sources
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("melpa" . "http://melpa.org/packages/")
			 ("marmalade" . "https://marmalade-repo.org/packages/")
			 ))



(unless package-archive-contents
  (package-refresh-contents))

;; load packages
(dolist (p '(ace-jump-mode browse-kill-ring company
			   expand-region golden-ratio editorconfig
			   magit markdown-mode
			   helm-projectile
			   js2-mode csharp-mode
			   monokai-theme multiple-cursors
			   zenburn-theme)
	)
  (unless (package-installed-p p)
    (package-install p)))

(editorconfig-mode 1)

;; emacs settings
(setq auto-save-default nil)
(setq make-backup-files nil)
(setq inhibit-startup-screen t)
(setq initial-scratch-message "")
(delete-selection-mode t)
(show-paren-mode t)
(electric-pair-mode 1)
(fset 'yes-or-no-p 'y-or-n-p)
(global-auto-revert-mode 1)
;(desktop-save-mode 1)

;; whitespace
(global-whitespace-mode 1)
(setq whitespace-style '(face tabs spaces tab-mark space-mark))

;; indentation
(electric-indent-mode t)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default tab-always-indent nil)

;; disable GUI bars
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; cursor - not working
(setq-default cursor-type 'bar)

;; helm
(helm-mode 1)
(helm-autoresize-mode)
(setq helm-autoresize-max-height 60)

;; projectile
(projectile-global-mode)
(setq projectile-indexing-method 'alien)  ;; For windows.
(setq projectile-enable-caching t)

;; helm-projectile
;; this is how c-c p f is bound to helm-projectile-find-file instead of projectile-find-file
(helm-projectile-on)
;; golden-radio
(golden-ratio-mode)

;; line number
(global-linum-mode 1)
(setq linum-format "%d")

;; magit
(setq magit-last-seen-setup-instructions "1.4.0")

;; company-mode
(global-company-mode)

;; theme
(load-theme 'monokai t)

;; patches
;; helm auto-resize with golden-ratio http://tuhdo.github.io/helm-intro.html
(defun pl/helm-alive-p ()
  (if (boundp 'helm-alive-p)
      (symbol-value 'helm-alive-p)))
(add-to-list 'golden-ratio-inhibit-functions 'pl/helm-alive-p)

;; local setting file. E.g: add additional exec-path
(load-file "~/.emacs.d/init-local.el")

;; key binding
(global-set-key (kbd "C-o") 'er/expand-region)
(global-set-key (kbd "C-c SPC") 'ace-jump-mode)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; file binding
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; customize added by the program
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(whitespace-tab ((t (:foreground "#75715E" :weight bold)))))
