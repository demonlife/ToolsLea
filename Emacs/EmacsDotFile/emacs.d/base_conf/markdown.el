;; markdown
(add-to-list 'load-path "~/.emacs.d/plugins/markdown-mode")
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'". markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'". markdown-mode))

(require 'iimage)
(add-hook 'info-mode-hook 'iimage-mode)
(add-hook 'markdown-mode-hook '(lambda()
               (define-key markdown-mode-map
                 (kbd "<f12>") 'turn-on-iimage-mode)))

(setq iimage-mode-image-search-path '(list "." ".."))

(add-to-list 'iimage-mode-image-regex-alist
       (cons (concat "!\\[.*?\\](/\\("
             iimage-mode-image-filename-regex
             "\\))") 1))
