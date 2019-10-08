;;; Dev/Repos/mystuff/dotfiles/doomconfigconfig.el -*- lexical-binding: t; -*-

;; Place your private configuration here

;; Custom key bindings should put here: https://github.com/hlissner/doom-emacs/wiki/Customization#customize-my-keybindings
(map! :leader
      :desc "Frame maximized" "tM" #'toggle-frame-maximized
      :desc "Commment line" "cl" #'comment-line
      "w/" #'split-window-right
      )
