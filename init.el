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

;; cursor - not working
(setq cursor-type 'bar)

;; helm
(helm-mode -1)
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
