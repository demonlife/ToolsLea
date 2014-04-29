;;启动时的大小和屏幕的中的位置
(setq default-frame-alist
    '((height . 35)(width . 100)(menubar-lines . 20)(tool-bar-lines . 0)))

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
;; 显示行号
(global-linum-mode 1)
(setq linum-format "%d")

;; 不要在鼠标点击的地方插入剪贴板的内容
(setq mouse-yank-at-point t)

;; 设置一个很大的kill ring
(setq kill-ring-max 500)

;; 将fill-column设为60
(setq default-fill-column 80)

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
;(scroll-bar-mode nil);去掉滚动条
;(scroll-bar-mode 0);

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
(setq frame-title-format 
      '("%S" (buffer-file-name "%f"
                               (dired-directory dired-directory "%b"))))

;;用于区分打开相同文件名时无法区分的情况下
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

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

;支持emacs和外部程序的粘贴
(setq x-select-enable-clipboard t)

;;用aspell程序替代ispell
(setq-default ispell-program-name "aspell")

(setq user-full-name "demonlife");设置全名
(setq user-mail-address "demonlife2013@gmail.com");设置个人邮箱

;;代码缩进
(require 'electric)
(electric-indent-mode +1)

;;高亮显示当前行
(global-hl-line-mode t)

;;默认使用Shitf+上下左右键来切换各个窗口
(windmove-default-keybindings)

;;窗口最大化以后调用另一个buffer
(setq winner-dont-bind-my-keys t)
(winner-mode t)
(global-set-key (kbd "C-c b") 'winner-undo)
(global-set-key (kbd "C-c f") 'winner-redo)

;;矩形选择功能
(cua-mode t)

;; 使用google搜索某个词
(defun google ()
  "Google the selected region if any, display a query prompt otherwise."
  (interactive)
  (browse-url
   (concat
    "http://www.google.com/search?ie=utf-8&oe=utf-8&q="
    (url-hexify-string (if mark-active
         (buffer-substring (region-beginning) (region-end))
         (read-string "Google: "))))))

(global-set-key (kbd "C-c g") 'google)

;;;Open File in External Program START
(defun open-with ()
  "Simple function that allows us to open the underlying
file of a buffer in an external program."
  (interactive)
  (when buffer-file-name
    (shell-command (concat
                    (if (eq system-type 'darwin)
                        "open"
                      (read-shell-command "Open current file with: "))
                    " "
                    buffer-file-name))))

(global-set-key (kbd "C-c o") 'open-with)
;;; END

;; 编码设置 begin
(set-language-environment 'Chinese-GB)
;; default-buffer-file-coding-system变量在emacs23.2之后已被废弃，使用buffer-file-coding-system代替
(set-default buffer-file-coding-system 'utf-8-unix)
(set-default-coding-systems 'utf-8-unix)
(setq-default pathname-coding-system 'euc-cn)
(setq file-name-coding-system 'euc-cn)
;; 另外建议按下面的先后顺序来设置中文编码识别方式。
;; 重要提示:写在最后一行的，实际上最优先使用; 最前面一行，反而放到最后才识别。
;; utf-16le-with-signature 相当于 Windows 下的 Unicode 编码，这里也可写成
;; utf-16 (utf-16 实际上还细分为 utf-16le, utf-16be, utf-16le-with-signature等多种)
(prefer-coding-system 'cp950)
(prefer-coding-system 'gb2312)
(prefer-coding-system 'cp936)
(prefer-coding-system 'gb18030)
;(prefer-coding-system 'utf-16le-with-signature)
(prefer-coding-system 'utf-16)
;; 新建文件使用utf-8-unix方式
;; 如果不写下面两句，只写
;; (prefer-coding-system 'utf-8)
;; 这一句的话，新建文件以utf-8编码，行末结束符平台相关
(prefer-coding-system 'utf-8-dos)
(prefer-coding-system 'utf-8-unix)
;; 编码设置 end

;; 对当前的文档添加注释
(defun add-code-review-note ()
   "Add note for current file and line number"
   (interactive)
   (let ((file-name (buffer-file-name))
         (file-line (line-number-at-pos)))
     (switch-to-buffer-other-window (get-buffer-create "NOTES"))
     (goto-char (point-min))
     (when (not (search-forward "-*- mode:compilation-shell-minor"
                                nil t))
       (compilation-shell-minor-mode 1)
       (insert "-*- mode:compilation-shell-minor -*-\n\n"))
     (goto-char (point-max))
     (if (/= (current-column) 0)
         (newline))
     (insert file-name ":" (number-to-string file-line) ": ")))
(global-set-key (kbd "C-x a") 'add-code-review-note)

;;格式话整个文件函数,可以避免光标位置移动。
(defun indent-buffer ()
  "Indent the whole buffer."
  (interactive)
  (save-excursion
    (indent-region (point-min) (point-max) nil)))
(global-set-key [f7] 'indent-buffer)
