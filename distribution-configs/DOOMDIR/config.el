;;; Dev/Repos/mystuff/dotfiles/doomconfigconfig.el -*- lexical-binding: t; -*-

;; Place your private configuration here

;; Custom key bindings should put here: https://github.com/hlissner/doom-emacs/wiki/Customization#customize-my-keybindings
(map! :leader
      :desc "Frame maximized" "tM" #'toggle-frame-maximized
      :desc "Commment line" "cl" #'comment-line

      ;; use 'eval-window-vsplit (SPC-w-v)
      ;; "w/" #'split-window-right
      )

;; My Customizations
(toggle-frame-maximized)

(setq which-key-idle-delay .4)

(setq dired-dwim-target t)

(after! evil-escape
  (setq
   evil-escape-key-sequence "jj"
   evil-escape-delay 0.25
   )
  )

(defun my-web-mode-hook ()
  "Hooks for Web mode."
  ;; this is compatible with vue cli prettier config
  (setq web-mode-script-padding 0)
  (message "indentation updated!")
)
(add-hook 'web-mode-hook 'my-web-mode-hook)
