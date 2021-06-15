;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Gabriel Arrillaga"
      user-mail-address "gabriel.arrillaga@blockfi.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))
(setq doom-font (font-spec :name "Source Code Pro" :size 13.0))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
; (setq doom-theme 'doom-one)
(setq doom-theme 'doom-tomorrow-night) ; doom-dark+ ; from VS code
; https://github.com/hlissner/emacs-doom-themes

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type nil)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

; (use-package! unfill)

(setq magit-git-executable "/usr/local/bin/git")

;; TODO this seems to get overwritten?
(setq evil-default-state 'emacs
 ;; evil-emacs-state-modes (append evil-normal-state-modes evil-motion-state-modes evil-insert-state-modes)
 evil-emacs-state-modes nil
 evil-normal-state-modes nil
 evil-motion-state-modes nil
 evil-insert-state-modes nil
 ;; evil-respect-visual-line-mode t
 ;; https://github.com/hlissner/doom-emacs/issues/401 (maybe put ^ these in init too?)
 )

(add-hook 'evil-local-mode-hook #'evil-emacs-state)
;; (add-hook 'evil-snipe-local-mode-hook #'evil-emacs-state)
;; (add-hook 'evil-snipe-override-local-mode-hook #'evil-emacs-state)

;; (evil-set-initial-state 'magit 'emacs)

;; https://github.com/hlissner/doom-emacs/blob/develop/docs/getting_started.org#configuring-doom
;; ...otherwise, make sure they always return non-nil!
(use-package-hook! evil
 :pre-init
 (setq evil-magic nil)
 t)

;; TODO:
;; source .env.dev vars
;; http://ergoemacs.org/emacs/emacs_env_var_paths.html
;; https://www.emacswiki.org/emacs/DirectoryVariables
;; https://stackoverflow.com/questions/9663396/how-do-i-make-emacs-recognize-bash-environment-variables-for-compilation
;; https://emacs.stackexchange.com/questions/6104/reload-environment-variables

;; or just start emacs from inside that shell session?

;; TODO icons too big
;; https://github.com/sebastiencs/company-box/
;; (use-package company-box
;; :hook (company-mode . company-box-mode)
 ;)
;; (with-eval-after-load 'elixir-mode
;; (spacemacs/declare-prefix-for-mode 'elixir-mode
;; "mt" "tests" "testing related functionality")
;; (spacemacs/set-leader-keys-for-major-mode 'elixir-mode
;; "tb" 'exunit-verify-all
;; "ta" 'exunit-verify
;; "tk" 'exunit-rerun
;; "tt" 'exunit-verify-single))

;; M-x flycheck-verify-setup
;; If syntax checker fails although it successfully verified, in file run:
;; M-x flycheck-compile
;;

(setq doom-leader-alt-key "M-SPC") ;; C-c
(setq doom-localleader-alt-key "M-SPC m") ;; C-c l

(global-set-key (kbd "M-(") 'winum-select-window-1)
(global-set-key (kbd "M-)") 'winum-select-window-2)
(global-set-key (kbd "M-}") 'winum-select-window-3)
(global-set-key (kbd "M-+") 'winum-select-window-4)
(global-set-key (kbd "C-M-f") 'unfill-region)

(+global-word-wrap-mode +1)
;; disable remap of kill-line to 'kill-visual-line so that kill doesn't stop at arbitrary visual break
(define-key visual-line-mode-map [remap kill-line] nil)

;; Default hl-todo faces:
;; (("TODO" . "#cc9393")
;; ("NEXT" . "#dca3a3")
;; ("THEM" . "#dc8cc3")
;; ("PROG" . "#7cb8bb")
;; ("OKAY" . "#7cb8bb")
;; ("DONT" . "#5f7f5f")
;; ("FAIL" . "#8c5353")
;; ("DONE" . "#afd8af")
;; ("NOTE" . "#d0bf8f")
;; ("KLUDGE" . "#d0bf8f")
;; ("HACK" . "#d0bf8f")
;; ("TEMP" . "#d0bf8f")
;; ("FIXME" . "#cc9393")
;; ("XXX+" . "#cc9393"))
;;
;; Default Doom customizations:
;; (("TODO" warning bold)
;; ("FIXME" error bold)
;; ("HACK" font-lock-constant-face bold)
;; ("REVIEW" font-lock-keyword-face bold)
;; ("NOTE" success bold)
;; ("DEPRECATED" font-lock-doc-face bold))
(after! hl-todo
 (setq hl-todo-keyword-faces
 (append hl-todo-keyword-faces
 '(
 ("MAYBE" font-lock-keyword-face bold)
 ("TEST" warning bold)
 ))))

;; If you use custom-set-variables or customize-set-variable instead of setq, or if you use the Customize user interface (e.g. M-x customize-option), then you are sure that any intended initialization or updating code that is needed for the option value will be automatically triggered and run as needed. If you use setq, this will not be done.
(custom-set-variables '(magit-todos-keywords 'hl-todo-keyword-faces))

(magit-todos-mode)

(setq-default
 standard-indent 2
 fill-column 120
 ;; js2-mode
 ;;js2-basic-offset 2
 ;;js-indent-level 2 ;; JSON files
 ;;js2-indent-switch-body t
 ;;js2-strict-missing-semi-warning
 ;; web-mode
 js-indent-level 2
 css-indent-offset 2
 web-mode-markup-indent-offset 2
 web-mode-css-indent-offset 2
 web-mode-code-indent-offset 2
 web-mode-attr-indent-offset 2
 tab-always-indent t
 ;; Elixir
 ;;elixir-enable-compilation-checkin nil
 ;;
 show-trailing-whitespace t
 )

(setq magit-display-buffer-function #'magit-display-buffer-fullcolumn-most-v1)

;; it turns out I fucking hate the selectivity of ws-butler and really just want it *all* to be cleaned on save
(add-hook 'before-save-hook 'whitespace-cleanup)

;; ;; (add-hook 'js2-mode-hook
;; ;; (lambda()
;; ;; (when (executable-find "eslint")
;; ;; (flycheck-select-checker 'javascript-eslint))))

;; (add-hook 'flycheck-mode
;;  (lambda()
;;  (when (executable-find "eslint")
;;  (flycheck-select-checker 'javascript-eslint))))

;; Options: https://github.com/emacs-lsp/lsp-ui/blob/master/lsp-ui-peek.el (and others: https://github.com/emacs-lsp/lsp-ui)
(after! lsp-ui
 ;; (map! :map lsp-ui-mode-map
 ;; [remap xref-find-definitions] . lsp-ui-peek-find-definitions
 ;; [remap xref-find-references] . lsp-ui-peek-find-references)
 (progn
 (evil-set-initial-state 'lsp-ui-imenu-mode 'emacs)
 (setq lsp-ui-doc-max-height 50
 lsp-ui-doc-max-width 120
 ;;lsp-ui-doc-max-width (window-body-width) ;frame-width ?

 lsp-ui-doc-header t
 lsp-ui-doc-include-signature t

 ;; lsp-ui-doc-enable t
 ;;lsp-ui-doc-use-childframe t
 lsp-ui-doc-position 'bottom ; 'at-point ; 'bottom ; 'top
 lsp-ui-doc-alignment 'window

 lsp-ui-doc-use-webkit nil
 lsp-ui-imenu-kind-position 'left ; 'top ; sideline
 lsp-ui-sideline-ignore-duplicate t
 lsp-ui-sideline-code-actions-prefix "💡"

 ;; TODO
 ;; lsp-sideline-delay 2
 ;; lsp-ui-doc-delay

 ;; this is what shows the function signatures
 ;; lsp-ui-sideline-show-hover t

 ;; TODO what is this? set to to true by default - maybe disabling show-hover isn't an issue if this is false?
 ;; lsp-ui-sideline-show-symbol nil
 ;; /r/emacs comment: "I personally set lsp-ui-sideline-show-symbol to nil and use the sideline only for errors/code actions."
 ;;
 ;; or:
 ;; (mapcar (lambda (f) (set-face-foreground f "dim gray"))
 ;; '(lsp-ui-sideline-code-action lsp-ui-sideline-current-symbol lsp-ui-sideline-symbol lsp-ui-sideline-symbol-info))

 lsp-ui-peek-enable t
 ;; fix for completing candidates not showing after “Enum.”:
 ;; company-lsp-match-candidate-predicate #'company-lsp-match-candidate-prefix
 )))

;; https://github.com/hlissner/doom-emacs/blob/develop/docs/getting_started.org#configuring-doom
(after! lsp
 (add-hook 'lsp-mode #'lsp-ui-mode))

(defvar-local explore-active nil)

;; TODO go through rest of this: DAP, Exunit, etc. https://elixirforum.com/t/emacs-elixir-setup-configuration-wiki/19196

;; TODO
;; https://medium.com/better-programming/15-reasons-why-i-use-emacs-with-gifs-5b03c6608b61
;; Folding/unfolding code
;; You can toggle za, open zo, or close zc a section of the code.

;; TODO figure out how to get this to stretch across entire buffer
;; maybe try looking into this: https://github.com/hlissner/doom-emacs/blob/develop/modules/ui/popup/README.org

;; TODO alter background color so it stands out a bit more
;; (custom-set-faces
;; '(lsp-ui-doc-background ((t :background "#0000ff")))

(defun lsp-ui-doc-open ()
 "Description"
 (interactive)
 (progn
 (lsp-ui-doc-show)
 (lsp-ui-doc-focus-frame)
 (setq explore-active t)))

(defun lsp-ui-doc-close ()
 "desc"
 (interactive)
 (progn
 (lsp-ui-doc-unfocus-frame)
 (lsp-ui-doc-hide)
 (setq explore-active nil)
 t))

(defun lsp-ui-doc-toggle ()
 "desc"
 (interactive)
 (if explore-active
 (lsp-ui-doc-close)
 (lsp-ui-doc-open)))

(global-set-key (kbd "C-M-d") 'lsp-ui-doc-toggle)

(global-unset-key (kbd "C-M-s")) ; unbind isearch-forward-regex
(global-set-key (kbd "C-M-s") 'lsp-ui-imenu)

;; Treemacs
(global-unset-key (kbd "C-M-t"))
(global-set-key (kbd "C-M-t") 'treemacs-select-window) ; select if visible, open first if not

(defun treemacs-ignore? (filename absolute-path)
 (or (string-match "/.log" absolute-path)
 (string-match "/.elixir_ls" absolute-path)
 (string-match "/_build" absolute-path)
 (string-match "/deps" absolute-path)
 (string-match "/node_modules" absolute-path)
 (string-match "/build" absolute-path)))

(setq treemacs-show-hidden-files t
 ;; https://github.com/Alexander-Miller/treemacs/blob/master/README.org#git-mode
 treemacs-git-mode 'extended
 treemacs-follow-after-init t
 )

(after! treemacs
 (add-to-list 'treemacs-pre-file-insert-predicates #'treemacs-is-file-git-ignored?)
 (add-to-list 'treemacs-ignored-file-predicates #'treemacs-ignore?))


;; Undo Settings
(global-undo-tree-mode)
;; https://github.com/hlissner/doom-emacs/blob/develop/modules/ui/popup/README.org
(set-popup-rule! "*undo-tree*" :side 'right :modeline nil)
(remove-hook '+popup-buffer-mode-hook #'+popup-set-modeline-on-enable-h)
