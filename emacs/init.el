(modify-frame-parameters nil '((wait-for-wm . nil)))
(setq inhibit-splash-screen t)
(global-font-lock-mode t)
(global-hl-line-mode t)
(setq truncate-partial-width-windows t)
(global-set-key [M-return] 'dabbrev-expand)


;; Cask for package management
(require 'cask "~/.cask/cask.el")
(cask-initialize)


;; set default python indentation to two spaces
(add-hook 'python-mode-hook
      (lambda ()
        (setq indent-tabs-mode nil)
        (setq python-indent 2)))


(autoload 'matlab-mode "matlab" "Matlab Editing Mode" t)
(add-to-list 'auto-mode-alist '("\\.m$" . matlab-mode))
(setq matlab-indent-function t)


;; scroll through open buffers with Ctrl + mousewheel up /down
(global-set-key (kbd "<C-mouse-4>") 'next-buffer)
(global-set-key (kbd "<C-mouse-5>") 'previous-buffer)


;; show column numbers
(setq column-number-mode t)



;; Switches between source/header files
(defvar c++-source-extension-list '("c" "cc" "C" "cpp" "c++" "hsm"))
(defvar c++-header-extension-list '("h" "hh" "H" "hpp"))
;; Default extension for c++ header files.
(defvar c++-default-header-ext "hh")
;; Default extension for c++ source files.
(defvar c++-default-source-ext "cc")
;; Default regexp for c++ header files.
(defvar c++-header-ext-regexp "\\.\\(hpp\\|h\\|\hh\\|H\\)$")
;; Default regexp for c++ source files.
(defvar c++-source-ext-regexp "\\.\\(cpp\\|c\\|\cc\\|C\\)$")
(defvar c++-ext-regexp "\\.\\(hpp\\|h\\|\hh\\|H\\|cpp\\|c\\|\cc\\|C\\)$")

(defconst my-c-style
  '((c-tab-always-indent        . t)
    (c-basic-offset . 2)
    (c-hanging-braces-alist     . ((substatement-open after)
                                   (brace-list-open)))
    (c-hanging-colons-alist     . ((member-init-intro before)
                                   (inher-intro)
                                   (case-label after)
                                   (label after)
                                   (access-label after)))
    (c-cleanup-list             . (scope-operator
                                   empty-defun-braces
                                   defun-close-semi))
    (c-offsets-alist            . ((arglist-close . c-lineup-arglist)
                                   (substatement-open . 0)
                                   (case-label        . 2)
                                   (block-open        . 0)
                                   (knr-argdecl-intro . -)))
    )
  "My C Programming Style")

;; offset customizations not in my-c-style
(setq c-offsets-alist '((member-init-intro . ++)))

;; Customizations for all modes in CC Mode.
(defun my-c-mode-common-hook ()
  ;; add my personal style and set it for the current buffer
  (c-add-style "PERSONAL" my-c-style t)
  ;; other customizations
  (setq tab-width 4
        ;; this will make sure spaces are used instead of tabs
        indent-tabs-mode nil)
  ;; use subword motion
  (c-subword-mode 1)
  ;; auto-newline and hungry-delete
  ; (c-toggle-auto-hungry-state 1)
  (define-key c-mode-base-map "\C-m" 'c-context-line-break))

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)






(defun toggle-source-header()
  "Switches to the source buffer if currently in the header buffer and vice versa."
  (interactive)
  (let ((buf (current-buffer))
	(name (file-name-nondirectory (buffer-file-name)))
	file
	offs)
    (setq offs (string-match c++-header-ext-regexp name))
    (if offs
	(let ((lst c++-source-extension-list)
	      (ok nil)
	      ext)
	  (setq file (substring name 0 offs))
	  
	  (while (and lst (not ok))
	    (setq ext (car lst))
	    (if (file-exists-p (concat file "." ext))
								(setq ok t))
	    (setq lst (cdr lst)))
	  (if ok
	      (find-file (concat file "." ext))))
      (let ()
	(setq offs (string-match c++-source-ext-regexp name))
	(if offs
	    (let ((lst c++-header-extension-list)
		  (ok nil)
		  ext)
	      (setq file (substring name 0 offs))
	      (while (and lst (not ok))
		(setq ext (car lst))
		(if (file-exists-p (concat file "." ext))
		    (setq ok t))
		(setq lst (cdr lst)))
	      (if ok
		  (find-file (concat file "." ext)))))))))

(global-set-key [f7] 'toggle-source-header)
(global-set-key [f4] 'goto-line)

(set-default-font "7x14")
(set-background-color "Black")
(set-foreground-color "White")
(set-cursor-color "White")

(global-set-key [(shift left)] 'windmove-left)
(global-set-key [(shift right)] 'windmove-right)
(global-set-key [(shift up)] 'windmove-up)
(global-set-key [(shift down)] 'windmove-down)

(global-set-key [(shift control left)] 'shrink-window-horizontally)
(global-set-key [(shift control right)] 'enlarge-window-horizontally)
(global-set-key [(shift control up)] 'enlarge-window)
(global-set-key [(shift control down)] 'shrink-window)
(global-set-key "\M-g" 'goto-line)
(global-set-key "\C-a" 'indent-region)

(setq compilation-read-command nil)
(global-set-key [f9] 'compile)



(global-set-key "\C-c;" 'comment-region)
(global-set-key "\C-c:" 'uncomment-region)

;; remove toolbar
(tool-bar-mode -1)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(cua-mode t nil (cua-base))
  '(package-selected-packages (quote (dockerfile-mode flycheck)))
 '(tool-bar-mode nil))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )


; start flycheck syntax checker
(add-hook 'after-init-hook #'global-flycheck-mode)


; start package.el package manager with emacs
(require 'package)
; add MELPA repo
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
; init package.el
(package-initialize)


(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "Black" :foreground "White" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "unknown" :family "DejaVu Sans Mono")))))


;; Use Markdown mode for .markdown and .md files
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
