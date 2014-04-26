;;显示时间
(display-time)
(display-time-mode 1);;启用时间显示设置，在minibuffer上面的那个杠上
(setq display-time-24hr-format t);;时间使用24小时制
(setq display-time-day-and-date t);;时间显示包括日期和具体时间
(setq display-time-use-mail-icon t);;时间栏旁边启用邮件设置
;;(setq display-time-interval 10);;时间的变化频率，单位多少来着？

;; 关闭错误提示声
(setq visible-bell t)

;;显示列号
(setq column-number-mode t)

;; 不要在鼠标点击的地方插入剪贴板的内容
(setq mouse-yank-at-point t)

;; 设置一个很大的kill ring
(setq kill-ring-max 200)

;; 将fill-column设为60
(setq default-fill-column 60)


;;不产生备份文件
(setq make-backup-files nil)
;;不生成临时文件
(setq-default make-backup-files nil)

;;设置TAB宽度为4
(setq default-tab-width 4) 
;;使用空格缩进，不用tab缩进可以避免很多错误
(setq-default indent-tabs-mode nil)
(setq tab-always-indent nil)
(setq tab-stop-list ())
(setq tab-width 4)

;; 去掉滚动条
(set-scroll-bar-mode nil)
;;关闭开启画面
(setq inhibit-startup-message t)
;;禁用工具栏
(tool-bar-mode nil)
;;禁用菜单栏
;;(menu-bar-mode nil)

;;ido的配置,这个可以使你在用C-x C-f打开文件的时候在后面有提示;
;;这里是直接打开了ido的支持，在emacs23中这个是自带的.
(ido-mode t)

;; 设置sentece-end可以识别中文标点。
(setq sentence-end "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
(setq sentence-end-double-space nil)

;; 递归使用minibuffer
(setq enable-recursive-minibuffers t)

;; 防止页面滚动时跳动， scroll-margin 3 可以在靠近屏幕边沿3行时就开始滚动
(setq scroll-margin 3
      scroll-conservatively 10000)

;; 将缺省的major mode设置为text-mode, 而不是几乎什么功能也 没有的 fundamental-mode
(setq default-major-mode 'text-mode)

;; 显示括号匹配
(show-paren-mode t)
(setq show-paren-style 'parentheses)

;; 光标靠近鼠标指针时，让鼠标指针自动让开，别挡住视线
(mouse-avoidance-mode 'animate)

;; 标题显示有用信息
(setq frame-title-format "emacs@%b")

;; 可以直接打开和显示图片
(auto-image-file-mode)

;; 语法高亮
(global-font-lock-mode t)

;; 打开缺省禁用的功能
(put 'set-goal-column 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'LaTeX-hide-environment 'disabled nil)

;; 让dired可以递归的拷贝和删除目录
(setq dired-recursive-copies 'top)
(setq dired-recursive-deletes 'top)
