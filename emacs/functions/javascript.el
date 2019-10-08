;; possible source: https://gist.github.com/julianusti/83646d8c147f62825e6eed1eba087110
(defun my/use-eslint-from-node-modules ()
  (let* ((root (locate-dominating-file
		(or (buffer-file-name) default-directory)
		"node_modules"))
	 (eslint (and root
		      (expand-file-name "node_modules/eslint/bin/eslint.js"
					root))))
    (when (and eslint (file-executable-p eslint))
      (setq-local flycheck-javascript-eslint-executable eslint))))
