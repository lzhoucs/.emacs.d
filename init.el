(package-initialize)

;; package archive sources
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("melpa" . "http://melpa.org/packages/")
			 ("marmalade" . "https://marmalade-repo.org/packages/")
			 ))

;; emacs settings
(setq auto-save-default nil)
(setq make-backup-files nil)
(setq inhibit-startup-screen t)
(setq initial-scratch-message "")
(delete-selection-mode t)
(show-paren-mode t)
(fset 'yes-or-no-p 'y-or-n-p)
(electric-pair-mode 1)
(global-auto-revert-mode 1)

;; disable GUI bars
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; helm
(helm-mode)
(helm-autoresize-mode)
(setq helm-autoresize-max-height 60)

;; projectile
(projectile-global-mode)
(setq projectile-indexing-method 'alien)  ;; For windows.
(setq projectile-enable-caching t)

;; golden-radio
(golden-ratio-mode)

;; line number
(global-linum-mode 1)
(setq linum-format "%d ")

;; magit
(setq magit-last-seen-setup-instructions "1.4.0")

;; company-mode
(global-company-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("6a9606327ecca6e772fba6ef46137d129e6d1888dcfc65d0b9b27a7a00a4af20" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-theme 'zenburn t)

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
