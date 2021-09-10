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
(setq doom-font (font-spec :name "Source Code Pro" :size 12.0))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
; (setq doom-theme 'doom-one)
(setq doom-theme 'doom-tomorrow-night) ; doom-dark+ ; from VS code
;; https://github.com/hlissner/emacs-doom-themes

(setq doom-themes-treemacs-theme "doom-colors") ;; "doom-colors" uses all-the-icons (default: "doom-atom")
;; NOTE: if using "doom-atom" re-configure helm to match
;; (after! helm
;;   (setq helm-icons-provider 'treemacs)) ;; (default: 'all-the-icons)

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

(setq magit-git-executable "/usr/bin/git")

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


;; Test Runner
;; https://elixirforum.com/t/emacs-elixir-setup-configuration-wiki/19196/161
;; spacemacs example: (but "I think the snippet should work properly for doom-emacs")
;; (push '("*exunit-compilation*" :dedicated t :position bottom :stick t :height 0.4) popwin:special-display-config)
;; 
;; ^ Awesome! I’ve been meaning to figure out how to accomplish that.
;; This is pure gold :smiley: Thank you!
;; 
;; from Elixir core team member: I also added :noselect t to the snippet (at the recommendation of someone on the Slack) so that the compilation buffer doesn’t take focus when you run the tests.
;; resp: I actually prefer it to be selected so it’s easier to navigate to failing output and jump to the test. Each to their own though!


;; Credo/Flycheck
;; Update: I finally solved my flycheck problems (yes, from July 2019). I’ve got lsp checking (dialyzer & elixir compiler) and credo working in a chain. The key was this: (setq lsp-flycheck-live-reporting nil). Disabling that prevents lsp from stomping on the value in flycheck-check-syntax-automatically. I think they are trying to replace that, but at least in a project the size of mine you cannot be running flycheck on idle/new line etc. I’ve long run it only on enable and save. Every now and then I’ll save before the last check finished and things get out of a sync so I do a quick s e b
;;
;; Relevant configs:
;;
;;  (add-hook 'elixir-mode-hook
;; (lambda ()
;;     (setq lsp-flycheck-live-reporting nil)
;;     (setq-local flycheck-check-syntax-automatically '(mode-enabled save))))
;;
;; (add-hook 'lsp-after-initialize-hook
;;           (lambda ()
;;             (lsp--set-configuration `(:elixirLS, lsp-elixir--config-options))
;;             (elixir/init-flycheck-credo)
;;             (flycheck-add-next-checker 'lsp 'elixir-credo)))


;; Have you checked *lsp-log* buffer as mentioned in the error message?

;; Also exec-path is emacs equivalent of most OS’ PATH variable. You need to specify a folder, not the file directly.

;; If you want to specify the exectuable directly, then you need to (setq lsp-clients-elixir-server-executable "/Users/eskimag/.emacs.d/elixir-ls/release/language_server.sh). The default value for that variable is "language_server.sh", so it should work if you add "/Users/eskimag/.emacs.d/elixir-ls/release" to exec-path.

;; ************ Custom Emacs Utility Funcs ************
;; this isn't working....
;; (defun remove-from-list (list-var val)
;;   ;(progn
;;     (setq list-var '(remove val list-var)))

;; (setq test '("bro" "yo"))
;; (remove "bro" test) ; though this does

;; (setq test '("bro" "yo" "homie"))

;; (remove-from-list test "yo")



;; *********** Window ***********

(setq initial-frame-alist '((top . 1) (left . 1) (height . 75) (width . 240)))
;; MacOS: ((top . 1) (left . 1) (height . 95) (width . 300))
;; Ubuntu: ((top . 1) (left . 1) (height . 75) (width . 240))
;; ^ no idea how these numbers related to pixels, these values resulted from trial and error...
;;
;; possibly helpful funcs to do this without repeatedly closing/re-opening Emacs:
;;
;; (display-pixel-height)
;; (display-pixel-width)



;; *********** Formatting ***********

;; For some reason, format-all-mode is using neither elixir-format nor lsp-format-buffer - which are both automatically aware of .formatter.exs (somehow even *without* Projectile snippet... built-in to Doom?)

;; this disables format-all-mode (bad var name - this list is prefixed with 'not')
(add-to-list '+format-on-save-enabled-modes 'elixir-mode t)
;; doesn't work:
;; (add-hook! 'elixir-mode-hook (format-all-mode -1))

;; Create a buffer-local hook to run elixir-format on save, only when we enable elixir-mode.
(add-hook 'elixir-mode-hook
          (defun format-on-save-override ()
            (add-hook 'before-save-hook 'elixir-format nil t)))
;;   (lambda () (add-hook 'before-save-hook 'elixir-format nil t)))

;; NOTE: (apparently unnecessary) Projectile snippet
;; https://awesomeopensource.com/project/anildigital/mix-format.el
;; (add-hook 'elixir-format-hook (lambda ()
;;                                 (if (projectile-project-p)
;;                                     (setq elixir-format-arguments
;;                                           (list "--dot-formatter"
;;                                                 (concat (locate-dominating-file
;;                                                          buffer-file-name
;;                                                          ".formatter.exs") ".formatter.exs")))
;;                                   (setq elixir-format-arguments nil))))

;; a seemingly similar example:
;; (add-hook! 'js2-mode-hook
;;   (unless (locate-dominating-file default-directory ".prettierrc")
;;     (format-all-mode -1)))


;; ************ Overrides ************
(global-set-key (kbd "C-s") 'swiper) ;; overrides isearch-forward

;; Undo Settings
(after! undo-tree
  (set-popup-rule! "*undo-tree*" :side 'right :modeline nil)
  (setq undo-tree-visualizer-diff nil) ;; don't automatically show the diff buffer
  ;; TODO figure out how to make diff buffer appear vertically under the tree visualizer
  )

;; Company Settings

;; ** prevent autocomplete from running when typing "do" **

;; maybe company-search-regexp-function var?

;; maybe this var?
;; (defvar-local company-search-filtering nil
;;  "Non-nil to filter the completion candidates by the search string")

;; (setq company-dabbrev-char-regexp "do")

;; only autocomplete upon pressing "TAB"
;; alternatively could just try increasing it > 0.2 default
(setq company-idle-delay 0.5) ;; default: 0.2 - nil disables

;; Shit This breaks Magit magit-section-toggle (and probably other stuff?) as-is - if I keep it need some conditional to check what it's overriding in the current buffer?
;; (add-hook 'company-mode-hook
;;           (defun remap-tab ()
;;             ;; +company/dabbrev
;;             ;; unsetting indent-for-tab-command
;;             (local-set-key (kbd "TAB") '+company/complete)))

;; workable alternative to ^, overrides capitalize-word
;; (global-set-key (kbd "M-c") '+company/complete)


;; TODO what is +tng
;; mode enables company-tng-frontend:
;; When the user changes the selection at least once, this
;; frontend will display the candidate in the buffer as if it’s
;; already there and any key outside of ‘company-active-map’ will
;; confirm the selection and finish the completion.


;; don't include 'relative style when toggling line numbers
;; TODO this isn't working on load, only when I manually evaluate this
;; TODO can simplify this func
(defun doom/toggle-line-numbers ()
  "Toggle line numbers."
  (interactive)
  (defvar doom--line-number-style display-line-numbers-type)
  (let* ((styles `(t nil))
         (order (cons display-line-numbers-type (remq display-line-numbers-type styles)))
         (queue (memq doom--line-number-style order))
         (next (if (= (length queue) 1)
                   (car order)
                 (car (cdr queue)))))
    (setq doom--line-number-style next)
    (setq display-line-numbers next)
    (message "Switched to %s line numbers"
             (pcase next
               (`t "normal")
               (`nil "disabled")
               (_ (symbol-name next))))))

;; FUCK YES! Way to go Gabe, this was it
(after! helm
   (setq helm-candidate-number-limit nil)) ;; (defaults - Doom: 50, Helm: 100)

;; Doom helm module defaults:
;; (setq helm-candidate-number-limit 50
;;         ;; Remove extraineous helm UI elements
;;         helm-display-header-line nil
;;         helm-mode-line-string nil
;;         helm-ff-auto-update-initial-value nil
;;         helm-find-files-doc-header nil
;;         ;; Default helm window sizes
;;         helm-display-buffer-default-width nil
;;         helm-display-buffer-default-height 0.25
;;         ;; When calling `helm-semantic-or-imenu', don't immediately jump to
;;         ;; symbol at point
;;         helm-imenu-execute-action-at-once-if-one nil
;;         ;; disable special behavior for left/right, M-left/right keys.
;;         helm-ff-lynx-style-map nil)

;; NOTE: from helm source:
;;
;; (defcustom helm-dabbrev-candidates-number-limit 1000
;;   "Maximum number of candidates to collect.
;; The higher this number is, the slower the computation of
;; candidates will be.  You can use safely a higher value with
;; emacs-26+.
;; Note that this have nothing to do with
;; `helm-candidate-number-limit', this means that computation of
;; candidates stop when this value is reached but only
;; `helm-candidate-number-limit' candidates are displayed in the
;; Helm buffer."
;;   :group 'helm-dabbrev
;;   :type 'integer)

;; helm-ff-candidate-number-limit 5000
;;   "The `helm-candidate-number-limit' for `helm-find-files' and friends.helm-

;; NOTE:
;; Helm keybindings:   https://github.com/hlissner/doom-emacs/blob/e886dc6c6851e9831ee60e0fb8908fc833848084/modules/config/default/%2Bemacs-bindings.el
;;
;; Module index:
;; https://github.com/hlissner/doom-emacs/blob/develop/docs/modules.org
;; popup has +defaults
;; NOTE: lookup has +dictionary +docsets +offline modifiers
;; dired has  +ranger +icons
;; ibuffer has +icons - TODO this looks useful "interactive buffer management"
;; helm has +childframe +icons
;; company has +childframe +tng (only complete with tab - incompatible with +childframe)
;; spell (disabled now) aspell +flyspell +enchant +everywhere +hunspell
;; modeline has +light
;;
;; TODO simplify Doom helm menus: figure out how to remove stuff I will never want to use

;; TODO not working, must be using something different
;; (add-to-list 'projectile-globally-ignored-directories "assets/static")



;; ************ LSP ************
;; NOTE: according to elixir-ls Github https://github.com/elixir-lsp/elixir-ls, this is what's supported:
;;  - Debugger support
;;  - Automatic, incremental Dialyzer analysis
;;  - Automatic inline suggestion of @specs based on Dialyzer's inferred success typings
;;  - Inline reporting of build warnings and errors
;;  - Documentation lookup on hover
;;  - Go-to-definition
;;  - Code completion
;;  - Code formatter
;;  - Find references to functions and modules (Thanks to @mattbaker)
;;  - Quick symbol lookup in file (Thanks to @mattbaker)
;;  - Quick symbol lookup in workspace and stdlib (both Elixir and erlang) (@lukaszsamson)https://emacs-lsp.github.io/lsp-mode/page/main-features/#code-actions-on-modeline

; lsp-headerline-breadcrumb-mode
; lsp-headerline-breadcrumb-segments
; default: (path-up-to-project file symbols)
; If lsp-headerline-breadcrumb-segments contains 'symbols, you can optionally label the corresponding entries in the headerline display by setting lsp-headerline-breadcrumb-enable-symbol-numbers to t.
;
;; TODO "In case LSP server supports hover feature:"
;; highlights arg in func head when hovering over ref in func body

;; https://elixirforum.com/t/emacs-elixir-setup-configuration-wiki/19196/161
;; NOTE: (after! lsp ...) does NOT work
(with-eval-after-load 'lsp-mode
  (add-to-list 'lsp-file-watch-ignored-directories ".elixir_ls$")
  ;; NOTE: the following look like they might be redundant with defaults:
  ;;   "[/\\\\]\\.deps\\'" - complaint about # of files watched upon start-up definitely confirms this doesn't match
  (add-to-list 'lsp-file-watch-ignored-directories "deps$")
  ;;  "[/\\\\]_build\\'" - M-x re-builder experimentation seems (?) to confirm this also doesn't
  (add-to-list 'lsp-file-watch-ignored-directories "_build$")
  ;; just going to assume the default node_modules regex is bad like ^
  (add-to-list 'lsp-file-watch-ignored-directories "node_modules$")
  ;; ah... but perhaps the reason the latter two don't seem to matter is that LSP is looking for *.ex files

  ;; To truly confirm try:
  ;;
  ;; (remove-from-list 'lsp-file-watch-ignored-directories "[/\\\\]_build\\'")
  ;;(remove-from-list 'lsp-file-watch-ignored-directories "[/\\\\]node_modules")
  ;;
  ;; or if can't get that func working:
  ;;
  ;; (setq lsp-file-watch-ignored-directories (remove "[/\\\\]_build\\'" lsp-file-watch-ignored-directories))
  ;; (setq lsp-file-watch-ignored-directories (remove "[/\\\\]node_modules" lsp-file-watch-ignored-directories))
  )

;; TODO/MAYBE figure out how to include certain deps to speed up jumping to source definition of e.g. phoenix, ecto, schema_dsl, etc funcs.
;; The tricky thing is that apparently Elisp Regexes don't support lookaheads...
;; Maybe try "Negated character class based solution for regex engines not supporting lookarounds" from https://stackoverflow.com/questions/1687620/regex-match-everything-but-speci

;; NOTE: M-x re-builder to experiment with Emacs Lisp regexes!
;; Recommendation from https://masteringemacs.org/article/re-builder-interactive-regexp-builder:
;; (require 're-builder)
;; (setq reb-re-syntax 'string)


;; NOTE: for after SPC-M c D/d jump
;; 
;; xref-quit-and-pop-marker-stack not mapped
;; xref-pop-marker-stack is remapped to better-jumper-jump-backward which is on <menu-bar>...
;; its alias alchemist-goto-jump-back is on M-,

;; NOTE: use lsp-restart-workspace to test this stuff?

;; Options: https://github.com/emacs-lsp/lsp-ui/blob/master/lsp-ui-peek.el (and others: https://github.com/emacs-lsp/lsp-ui)
(after! lsp-ui
  ;; (map! :map lsp-ui-mode-map
  ;; [remap xref-find-definitions] . lsp-ui-peek-find-definitions
  ;; [remap xref-find-references] . lsp-ui-peek-find-references)
  (progn ;; TODO is this progn necessary?
    (evil-set-initial-state 'lsp-ui-imenu-mode 'emacs)
    (setq
     ;; *** doc ***
     lsp-ui-doc-max-height 50
     lsp-ui-doc-max-width 120
     ;; lsp-ui-doc-max-width (window-body-width) ;frame-width ?
     lsp-ui-doc-header t
     lsp-ui-doc-include-signature t
     ;; lsp-ui-doc-enable t
     ;; lsp-ui-doc-use-childframe t
     lsp-ui-doc-position 'bottom ; 'at-point ; 'bottom ; 'top
     lsp-ui-doc-alignment 'window
     lsp-ui-doc-use-webkit nil
     ;; lsp-ui-doc-delay

     ;; *** imenu ***
     lsp-ui-imenu-enable nil
     lsp-ui-imenu-kind-position 'top ;; 'kind' refers to module name
     ;; lsp-ui-imenu-window-width set window width
     ;; lsp-ui-imenu--custom-mode-line-format mode line format
     ;; lsp-ui-imenu-auto-refresh auto refresh when necessary
     ;; lsp-ui-imenu-refresh-delay delay to refresh imenu
     ;; lsp-ui-imenu-auto-refresh t
     ;; NOTE/TODO equivalent of treemacs-follow-after-init is what's missing from lsp-ui-imenu

     ;; *** sideline ***
     ;; lsp-sideline-delay 2
     lsp-ui-sideline-ignore-duplicate t
     lsp-ui-sideline-code-actions-prefix "💡"
     ;; lsp-ui-sideline-show-hover t ;; this is what shows the function signatures
     ;; /r/emacs comment: "I personally set lsp-ui-sideline-show-symbol to nil and use the sideline only for errors/code actions."
     ;; or:
     ;;
     ;; (mapcar (lambda (f) (set-face-foreground f "dim gray"))
     ;; '(lsp-ui-sideline-code-action lsp-ui-sideline-current-symbol lsp-ui-sideline-symbol lsp-ui-sideline-symbol-info))

     ;; TODO what is this? set to to true by default - maybe disabling show-hover isn't an issue if this is false?
     ;; lsp-ui-sideline-show-symbol nil
     ;;

     ;; *** peek ***
     lsp-ui-peek-enable t
     ;; fix for completing candidates not showing after “Enum.”:
     ;; company-lsp-match-candidate-predicate #'company-lsp-match-candidate-prefix
     )))

;; lsp-ui-sideline-show-diagnostics show diagnostics messages in sideline
;; lsp-ui-sideline-show-hover show hover messages in sideline
;; lsp-ui-sideline-show-code-actions show code actions in sideline
;; lsp-ui-sideline-update-mode When set to 'line' the information will be updated when user changes current line otherwise the information will be updated when user changes current point
;; lsp-ui-sideline-delay seconds to wait before showing sideline

;; MAYBE/TODO
; lsp-ui-imenu--custom-mode-line-format
; (setq lsp-ui-doc-max-width 80)
;; https://github.com/hlissner/doom-emacs/blob/develop/docs/getting_started.org#configuring-doom
(after! lsp
 (add-hook 'lsp-mode #'lsp-ui-mode)) ;; TODO is this necessary?

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

;; NOTE: unnecessary SPC-M c k "jump to documentation" is better UI/UX
;; (global-set-key (kbd "C-M-d") 'lsp-ui-doc-toggle)

(global-unset-key (kbd "C-M-s")) ;; unbind isearch-forward-regex
(global-set-key (kbd "C-M-i") 'lsp-ui-imenu)

(global-set-key (kbd "C-M-s") 'lsp-treemacs-symbols)

(global-unset-key (kbd "C-M-r")) ;; unbind isearch-backward-regex
(global-set-key (kbd "C-M-r p") 'lsp-ui-peek-find-references) ;; this displays inline with lsp-ui-peek
(global-set-key (kbd "C-M-r h") 'lsp-find-references) ;; this displays in helm buffer

;; NOTE: available for use!
(global-unset-key (kbd "C-M-c")) ;; unbind exit-recursive-edit



;; ********** Treemacs **********

(global-unset-key (kbd "C-M-t")) ;; NOTE: disable Launch terminal shortcut in Ubuntu
(global-set-key (kbd "C-M-t") 'treemacs-select-window) ; select if visible, open first if not
;; NOTE?TODO: ^ this does not necessarily select the current file, perhaps combine with command associated with M-SPC o P

;; TODO yy - Copy the absolute path of the node at point.


(defun treemacs-ignore? (filename absolute-path)
 (or (string-match "/.log" absolute-path)
 (string-match "/.elixir_ls" absolute-path)
 (string-match "/_build" absolute-path)
 (string-match "/deps" absolute-path)
 (string-match "/node_modules" absolute-path)
 (string-match "/build" absolute-path)))

(setq treemacs-show-hidden-files t
 ;; https://github.com/Alexander-Miller/treemacs/blob/master/README.org#git-mode
 treemacs-git-mode 'simple
 treemacs-follow-after-init t
 )
;; NOTE:
;; The variable +treemacs-git-mode sets the type of git integration that treemacs has.

;; There are 3 possible values:

;; simple, which highlights only files based on their git status, and is slightly faster,
;; extended, which highlights both files and directories, but requires python,
;; deferred, same as extended, but highlights asynchronously.

;; NOTE: If +treemacs-git-mode is set to extended or deferred must  have python3 installed.

;; *** NOTE *** must M-x all-the-icons-install-fonts on new machines
(after! treemacs
  ;; (require 'treemacs-all-the-icons)
  ;; (treemacs-load-theme "all-the-icons")
  (add-to-list 'treemacs-pre-file-insert-predicates #'treemacs-is-file-git-ignored?)
  (add-to-list 'treemacs-ignored-file-predicates #'treemacs-ignore?))

;; TODO treemacs selecting symbol jumps to the file rather than just scrolling it like imenu - bad (probably configurable though?)
;; TAB	Do what I mean (as defined in treemacs-TAB-actions-config). Prefers expanding nodes by default.
;; RET	Do what I mean (as defined in treemacs-RET-actions-config). Prefers visiting nodes by default.
;;
;; default vals for TAB-actions
 ;; (treemacs-lsp-treemacs-deps-list-closed-state . treemacs-expand-lsp-treemacs-deps-list)
 ;; (treemacs-lsp-treemacs-deps-list-open-state . treemacs-collapse-lsp-treemacs-deps-list)
 ;; (treemacs-lsp-treemacs-deps-closed-state . treemacs-expand-lsp-treemacs-deps)
 ;; (treemacs-lsp-treemacs-deps-open-state . treemacs-collapse-lsp-treemacs-deps)
 ;; (treemacs-lsp-symbol-closed-state . treemacs-expand-lsp-symbol)
 ;; (treemacs-lsp-symbol-open-state . treemacs-collapse-lsp-symbol)

;; (add-hook 'lsp-treemacs-after-jump-hook
;;           (defun jump-back ()
;;             (recenter)
;;             (select-window (get-buffer-window (get-buffer lsp-treemacs-symbols-buffer-name)))))
;; (remove-hook 'lsp-treemacs-after-jump-hook 'jump-back)

;; **** OR ******

;; ;; Default
;; ;; (lsp-treemacs-define-action lsp-treemacs-symbols-goto-symbol (:location)
;; ;;   "Goto the symbol node at `point'."
;; ;;   (pop-to-buffer lsp-treemacs--symbols-last-buffer)
;; ;;   (goto-char (lsp--position-to-point location))
;; ;;   (run-hooks 'lsp-treemacs-after-jump-hook))

;; (defvar lsp-treemacs--original-buffer nil)

;; (lsp-treemacs-define-action lsp-treemacs-symbols-goto-symbol (:location)
;;   "Goto the symbol node at `point'."
;;   (with-selected-window
;;       (get-buffer-window lsp-treemacs--original-buffer)
;;     (goto-char (lsp--position-to-point location))
;;     (recenter))
;;   (run-hooks 'lsp-treemacs-after-jump-hook))

;; (defun lsp-treemacs-symbols ()
;;   "Show symbols view."
;;   (interactive)
;;   (let ((original-buffer (current-buffer)))
;;     (if-let (buf (get-buffer lsp-treemacs-symbols-buffer-name))
;;         (select-window (display-buffer-in-side-window buf lsp-treemacs-symbols-position-params))
;;       (let* ((buf (get-buffer-create lsp-treemacs-symbols-buffer-name))
;;              (window (display-buffer-in-side-window buf lsp-treemacs-symbols-position-params)))
;;         (select-window window)
;;         (set-window-dedicated-p window t)
;;         ;; Initialize now, as otherwise all buffer local variables are killed
;;         ;; and as such `treemacs-space-between-root-nodes' will be reset to its
;;         ;; global value. `lsp-treemacs--update' -> `lsp-treemacs-render' ->
;;         ;; `lsp-treemacs-initialize' -> `treemacs-mode' (because we haven't
;;         ;; enabled it already) -> `kill-all-local-variables'.
;;         (lsp-treemacs-initialize)
;;         (setq-local treemacs-default-visit-action 'treemacs-RET-action)
;;         (setq-local treemacs--width-is-locked nil)
;;         (setq-local treemacs-space-between-root-nodes
;;                     lsp-treemacs-symbols-space-between-root-nodes)
;;         (unless lsp-treemacs--symbols-timer
;;           (setq lsp-treemacs--symbols-timer (run-with-idle-timer 1 t #'lsp-treemacs--update)))
;;         (add-hook 'kill-buffer-hook 'lsp-treemacs--kill-symbols-buffer nil t)))
;;     ;; ***
;;     (setq lsp-treemacs--original-buffer original-buffer)
;;     ;; ***
;;     (with-current-buffer original-buffer (lsp-treemacs--update))))

;; Depending on your font you may experience the problem of treemacs’ icons seemingly jumping around left and right when they are expanded and collapsed when using the all-the-icons theme. The straighforward solution is to use a different font. You may also try a workaround of using a different font that applies onyl to the TAB characters used to align treemacs’ all-the-icons-based icons. To do that do not load treemacs-all-the-icons with require. Instead use the following alternative provided by treemacs itself:

;; (treemacs-load-all-the-icons-with-workaround-font "Hermit")
;; The Hermit font used here is just an example - you will need to pick a font that is available on your system and does not suffer from the tab width issue.

;; This line will load treemacs-all-the-icons (it must not have been loaded previously) and enable the all-the-icons theme. The given font argument will be used as the font for the alignment tabs used for the icons, hopefully alleviating the indentation problem. In addition treemacs-indentation and treemacs-indentation-string will be set to 1 and a (font-changed) TAB character respectively, so customizing them is (probably) not possible.

;; TODO
;; 4.2.1 Ace mode to open files
;; It is possible to open the file under cursor in exact the window you want. By default you have to press o a a to run ace selection mode and choose the window with keys a s d f. That behavior can be changed in two ways.

;; Set ace mode as default action
;; It is possible to set ace mode as default action for pressing RET on a file. To do this add following configuration to your dotfile.

;; (with-eval-after-load 'treemacs
;;   (treemacs-define-RET-action 'file-node-closed #'treemacs-visit-node-ace)
;;   (treemacs-define-RET-action 'file-node-open #'treemacs-visit-node-ace))
;; Use digits in ace mode
;; Just add the following to use digits instead of a s d f in ace (window selection) mode. Please note that the following code changes ace mode globally.

;; (setq aw-keys '(?1 ?2 ?3 ?4 ?5 ?6 ?7 ?8 ?9 ?0))





;; TODO organize the following

; trying doom env instead
;(add-to-list 'exec-path "/home/gabriel/elixir-ls/release")

;(setq 'exec-path (remove 'exec-path ("/home/gabriel/Documents/elixir-ls/release")))

 ;(elixir :variables elixir-backend 'lsp elixir-ls-path "/Users/gabriel/Documents/code/github/elixir-ls/1.8.1/release")


;; Elixir web mode?
;; Can’t wait to share with folks : GitHub - Matsa59/web-mode: web template editing mode for emacs 2
;; Basically I fix <%= f = form ... %> pattern (only support f = ... for now).
;; Also fix multilines for <%= ... %>.

;; I would like to have some feedbacks to improve web-mode mode for (l)eex.

;; For people using doom-emacs, in packages.el use

;; (package! web-mode
;;   :recipe (:host github :repo "Matsa59/web-mode"))
;; Disable web from init.el and install using doom sync -u

;; All your configuration should continue to works, I just change elixir language.

;; Too many times waiting for someone to fix this x)

;; Spacemacs users : don’t know the configuration but it should works too if you use web-mode.

;; Edit : for people who wants to wait for official release, you can track this PR : Improve elixir language by Matsa59 · Pull Request #1191 · fxbois/web-mode · GitHub 2


;; One thing though I think missing in alchemist. I’ve implemented it with custom function

;; (defun my-put-iex ()
;;   (interactive)
;;   (insert "require IEx; IEx.pry"))
;; (global-set-key (kbd "C-c a p i") 'my-put-iex)
;; It pastes require IEx; IEx.pry when you press C-c a p i.

;; C-c a is for user-space functions.
;; p i is for “paste IEx” :slight_smile:
