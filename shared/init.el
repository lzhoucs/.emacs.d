(after! yasnippet
  ;; add ./snippets dir to yasnippet
  (message "loading mine snippets")
  (add-to-list 'yas-snippet-dirs (concat my-shared-dir "snippets"))
  )
