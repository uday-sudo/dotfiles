;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "uday-sudo"
      user-mail-address "udayavengerdude@gmail.com")
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
;; (setq doom-font (font-spec :family "mononoki Nerd Font Mono" :size 18 :weight 'Regular)
;;       doom-variable-pitch-font (font-spec :family "FantasqueSansMono Nerd Font" :size 5))
(setq doom-font (font-spec :family "FantasqueSansMono Nerd Font" :size 22 :weight 'Regular)
       doom-variable-pitch-font (font-spec :family "FantasqueSansMono Nerd Font" :size 15))

;; For org mode
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; For the beacon the curson finder
(beacon-mode 1)
(setq beacon-push-mark 35)

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; Tab-jump-out comes to save the day (only while using YASnippets)
;;(setq yas-fallback-behavior '(apply tab-jump-out 1))
;;(tab-jump-out-mode)
;;(setq yas-fallback-behavior '(apply tab-jump-out 1))
(defun eide-smart-tab-jump-out-or-indent (&optional arg)
  "Smart tab behavior. Jump out quote or brackets, or indent."
  (interactive "P")
  (if (-contains? (list "\"" "'" ")" "}" ";" "|" ">" "]" ) (make-string 1 (char-after)))
      (forward-char 1)
    (indent-for-tab-command arg)))
;; Set Keybind
(global-set-key [remap indent-for-tab-command]
                'eide-smart-tab-jump-out-or-indent)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/gitjargan/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq global-display-line-number-mode t)
(setq display-line-numbers-type t)

;; This is for the completion engine COMPANY
(setq company-idle-delay 0.2
      company-minimum-prefix-length 3)

;; Mode line customization
(setq doom-modeline-height 32)
;; How wide the mode-line bar should be. It's only respected in GUI.
(setq doom-modeline-bar-width 6)
;; Whether display the icon for `major-mode'. It respects `doom-modeline-icon'.
(setq doom-modeline-major-mode-icon t)
;; Whether display the icon for the buffer state. It respects `doom-modeline-icon'.
(setq doom-modeline-buffer-state-icon t)


;;(setq lsp-java-server-install-dir (concat doom-etc-dir "/home/uday/.local/share/nvim/lsp_servers/jdtls/")
;;      lsp-java-workspace-dir (concat doom-etc-dir "java-workspace"))

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
