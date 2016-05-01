;;; packages.el --- zyk-layer layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: zhuoyikang <zhuoyikang@zhuoyikangdeMBP.lan>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `zyk-layer-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `zyk-layer/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `zyk-layer/pre-init-PACKAGE' and/or
;;   `zyk-layer/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst zyk-layer-packages
  '()
  "The list of Lisp packages required by the zyk-layer layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")



;;----------------------------------------------------------------------------
;; 归档已完成的任务
;;----------------------------------------------------------------------------


(defun my-org-archive-done-tasks ()
  (interactive)
  (org-map-entries 'org-archive-subtree "/DONE" 'file))

;;显示不够的内容。自动换行.
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))


;;----------------------------------------------------------------------------
;; 让你的上下左右键可以用来切换窗口
;;----------------------------------------------------------------------------

(when (fboundp 'winner-mode)
  (winner-mode 1))
(windmove-default-keybindings)
(global-set-key (kbd "<f7> ") 'winner-undo)


;;----------------------------------------------------------------------------
;; Grep
;;----------------------------------------------------------------------------

(require 'grep)
(grep-apply-setting 'grep-command  "grep -nr ")


(setq org-agenda-files (list "~/source/gtd" ))



;;org-mode 和winner模式冲突.
(add-hook 'org-shiftup-final-hook 'windmove-up)
(add-hook 'org-shiftleft-final-hook 'windmove-left)
(add-hook 'org-shiftdown-final-hook 'windmove-down)
(add-hook 'org-shiftright-final-hook 'windmove-right)


;;----------------------------------------------------------------------------
;; 习惯按键设置
;;----------------------------------------------------------------------------

(global-set-key (kbd "C-c C-b")   'ibuffer)
(global-set-key (kbd "C-c C-c")   'comment-region)
(global-set-key (kbd "C-c C-u")   'uncomment-region)
(global-set-key (kbd "C-q") 'backward-kill-word)
(global-set-key (kbd "C-c C-f") 'goto-line)
(global-set-key (kbd "C-c C-m") 'execute-extended-command)
;;(global-set-key (kbd "C-c C-m") 'helm-M-x)

(global-set-key (kbd "M-[") 'previous-buffer)
(global-set-key (kbd "M-]") 'next-buffer)

(global-set-key (kbd "s-<left>") 'ns-prev-frame)
(global-set-key (kbd "s-<right>") 'ns-next-frame)

(global-set-key (kbd "M-|") 'indent-region)
(global-set-key (kbd "M-h") 'mark-paragraph)

;; 多个windows窗口切换.
(global-set-key (kbd "s-[") 'ns-prev-frame)
(global-set-key (kbd "s-]") 'ns-next-frame)

(global-set-key (kbd "C-x C-k") 'kill-region)
(global-set-key (kbd "C-c C-f") 'goto-line)


;;(global-set-key (kbd "C-<up>") 'backward-paragraph)
;;(global-set-key (kbd "C-<down>") 'forward-paragraph)

(global-set-key (kbd "C-c v") 'ff-find-other-file)

(desktop-save-mode)
;;(desktop-revert)
;;光标显示成一条线。
;;(setq-default cursor-type 'bar)


;;----------------------------------------------------------------------------
;; 习惯按键设置
;;----------------------------------------------------------------------------

;; 打开大文件
(defun large-file-hook ()
  "If a file is over a given size, make the buffer read only."
  (when (> (buffer-size) (* 2 1024 1024))
    (setq buffer-read-only t)
    (buffer-disable-undo)
    (buffer-disable-undo)
    (linum-mode 0)
    (font-lock-mode 0)
    (fundamental-mode)))


(add-hook 'find-file-hooks 'large-file-hook)


;;----------------------------------------------------------------------------
;; erlang相关配置
;;----------------------------------------------------------------------------


(add-to-list 'load-path "~/.emacs.d/private/zyk-layer")
;; (add-to-list 'load-path "~/source/distel/elisp")
;; (require 'distel)
;; (distel-setup)

(require 'unicad)

(autoload 'csharp-mode "csharp-mode" "Major mode for editing C# code." t)
(setq auto-mode-alist
      (append '(("\\.cs$" . csharp-mode)) auto-mode-alist))



(defun vcity()
  (interactive)
  (find-file-existing "~/source/vcity"))




;;; packages.el ends here
