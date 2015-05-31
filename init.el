(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("melpa" . "http://melpa.org/packages/")
			 ("marmalade" . "https://marmalade-repo.org/packages/")
			 ))

; key binding
(global-set-key (kbd "C-o") 'er/expand-region)
(global-set-key (kbd "C-c SPC") 'ace-jump-mode)

; function settings
(menu-bar-mode -1)

(delete-selection-mode t)

(show-paren-mode t)

(ido-mode 1)
(ido-everywhere 1)

(global-linum-mode 1)

; auto-complete doesn't work for now
;(require 'auto-complete-config)
;(ac-config-default)

; variable settings
(setq inhibit-startup-screen t)

(setq make-backup-files nil)

(setq auto-save-default nil)

(setq linum-format "%d ")


(fset 'yes-or-no-p 'y-or-n-p)


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

;; workaround https://github.com/bbatsov/zenburn-emacs/issues/186
(add-hook 'after-init-hook (lambda () (load-theme 'zenburn t)))
(add-hook 'after-init-hook #'projectile-global-mode)
