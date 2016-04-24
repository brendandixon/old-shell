;; .emacs

;;; uncomment this line to disable loading of "default.el" at startup
;; (setq inhibit-default-init t)

;; enable visual feedback on selections
(setq transient-mark-mode t)

;; default to better frame titles
(setq frame-title-format
      (concat  "%b - emacs@" (system-name)))

;; default to unified diffs
(setq diff-switches "-u")

;; more convenient command for going to a specific line
(global-set-key "\M-g" 'goto-line)

;; always end a file with a newline
(setq require-final-newline t
      next-line-add-newlines nil
      indicate-empty-lines t)

;; insert spaces instead of tabs
(setq-default indent-tabs-mode nil)

;;; uncomment for CJK utf-8 support for non-Asian users
;; (require 'un-define)

;; turn off the startup message
(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t)

;; window information
(setq line-number-mode t
      column-number-mode t
      compilation-window-height 20)

;; keep things organized
(add-to-list 'load-path "~/.emacs.d")

;; customizations
(setq custom-file "~/.emacs.d/customize")
(load-file custom-file)

;; modes
(autoload 'tt-mode "tt-mode")
(add-to-list 'auto-mode-alist '("\\.tt$" . tt-mode))

(autoload 'ruby-mode "ruby-mode")
(add-to-list 'auto-mode-alist '("\\.rb\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))
(autoload 'sass-mode "sass-mode")
(add-to-list 'auto-mode-alist '("\\.sass$" . sass-mode))
(autoload 'scss-mode "scss-mode")
(add-to-list 'auto-mode-alist '("\\.scss$" . scss-mode))

;; start server for client usage
(server-start)
