(add-to-list 'load-path "~/.emacs.d/plugins/ibus-el-0.3.2")

(require 'ibus)
(add-hook 'after-init-hook 'ibus-mode-on)

;; Change cursor color depending on IBus status
(setq ibus-cursor-color '("red" "blue" "limegreen"))

;; Use S-SPC to toggle input status
(global-set-key (kbd "C-SPC") 'ibus-toggle)

