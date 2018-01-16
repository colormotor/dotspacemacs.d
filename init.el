;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.
(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     colors
     (colors :variables
             colors-enable-rainbow-identifiers nil
             colors-enable-nyan-cat-progress-bar (display-graphic-p))
     javascript
        osx
        auto-completion
        c-c++
        emacs-lisp
        git
        markdown
        org
        shell
        ranger
        bibtex
        (python :variables
                python-test-runner 'pytest)
                                        ;ipython-notebook
        ipython-notebook
        octave
        deft
        latex
        pdf-tools
        pandoc
        ivy
        html
        yaml
        themes-megapack
        extra-langs
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages
   '(  
      ob-ipython
      org-ref
      )
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages
   '(
     ;; Remove exec-path-from-shell since it fucks up xonsh (or vice versa)
     exec-path-from-shell
     evil-matchit
     evil-search-highlight-persist
     )
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. (default t)
   dotspacemacs-check-for-update t
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-editing-style 'hybrid
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner nil
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(recents projects)
   ;; Number of recent files to show in the startup buffer. Ignored if
   ;; `dotspacemacs-startup-lists' doesn't include `recents'. (default 5)
   dotspacemacs-startup-recent-list-size 5
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(clues
                         wombat
                         fogus
                         purple-haze
                         tao-yin
                         monokai
                         phoenix-dark-pink
                         graham
                         dorsey
                         spacemacs-light
                         spacemacs-dark
                         solarized-light
                         solarized-dark
                         leuven
                         monokai
                         zenburn)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 12
                               :weight normal
                               :width normal
                               ;:ns-antialias-text nil
                               ;:antialias nil
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; (Not implemented) dotspacemacs-distinguish-gui-ret nil
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$ t
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido nil
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers t
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'nil
   ))


(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init'.  You are free to put almost
ny user code here.  The exception is org related code, which should be placed
in `dotspacemacs/user-config'."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration. You are free to put any user code."

  ;; Note, took most of this file from https://github.com/gforsyth/dotfiles/blob/master/.spacemacs
  (require 'matlab)
  (defun my-matlab-shell-mode-hook ()
    (global-set-key "C-c" 'interrupt-process))
  (setq matlab-shell-hook 'my-matlab-shell-hook)
  (custom-set-variables
   '(matlab-shell-command-switches '("-nodesktop -nosplash")))

  ;; Drag and drop open on mac
  (if (fboundp 'ns-find-file)
      (global-set-key [ns-drag-file] 'ns-find-file))

  ;; Disable nyan cat animations
  (setq nyan-animate-nyancat nil)
  (setq nyan-wavy-trail nil)

  ;; Trying to fix scrolling
  (setq mouse-wheel-scroll-amount '(3 ((shift) . 1) ((control) . nil)))
  (setq mouse-wheel-progressive-speed nil)
  
  ;; Themes (use SPCE T n to cycle, or SPC T s to use helm)
  ;; [[http://themegallery.robdor.com]]
  (setq-default dotspacemacs-themes '(clues,
                                      sunny-day)) ;spacemacs-dark spacemacs-light leuven zenburn))
  ;; THEME descs:
  ;; ujelly (dark), sunny-day, twilight-anti-bright (med-dark), twilight-bright
  ;; tronesque (med dark), tao-yin (dark), tao-yang
  ;; clues (med-dark, nice orange hightlight on same line)
  ;; focus (grey highlight, not so bad but hard to read on current line)
  ;; phoenix-dark-pink Purplish nice dark

  ;; Interactive reg-exp builder syntax.
  ;; So emacs uses two different syntaxes for regexp, one is the "read" syntax (for code)
  ;; and one is the "string" syntax for interactive sessions (e.g. search and replace :S)
  (setq reb-re-syntax 'string)

  ;; Use C-u, C-d also in insert mode
  (global-set-key "\C-d" nil)
  ;(define-key evil-insert-state-map (kbd "C-u") 'evil-scroll-up)
  ;(define-key evil-insert-state-map (kbd "C-d") 'evil-scroll-down)
  (global-set-key "\C-u" 'evil-scroll-up)
  (global-set-key "\C-d" 'evil-scroll-down)

  ;; Delete selection
  (delete-selection-mode 1)

  ;; Comment/uncomment blocks of code
  (global-set-key "\C-cc" 'comment-region)
  (global-set-key "\C-cu" 'uncomment-region)

  ;(global-set-key "\C-\<" 'evil-shift-left); (region-beginning) (region-end)))
  ;(global-set-key "\C-\>" 'evil-shift-right); (region-beginning) (region-end)))

  ;;----------------Stop pinging random countries--------------
  ;;Weird bug in which trying to autocomplete something that looks even remotely
  ;;like a valid URL emacs hangs in the minibuffer and tries to ping it.
  ;;e.g. ~uda.array.vi<TAB>~ (aiming to expand to ~view~) leads to an attempt to
  ;;ping the U.S. Virgin Islands.  God this is weird.
  (setq ffap-machine-p-known 'reject)

  ;;------------------------------------------------------------
  ;; DOC-VIEW scrolling
  ;; Reading a PDF while taking notes in another window (2 window setup)
  ;; Hit M-[/M-] to go up/down while keeping cursor in current window.
  ;; http://www.idryman.org/blog/2013/05/20/emacs-and-pdf/
  (fset 'doc-prev "\C-xo\C-u\C-xo")
  (fset 'doc-next "\C-xo\C-d\C-xo")
  (global-set-key (kbd "M-[") 'doc-prev)
  (global-set-key (kbd "M-]") 'doc-next)

  ;; Doc view + latex
  ;(add-hook 'doc-view-mode-hook 'auto-revert-mode)
  (eval-after-load 'doc-view
    '(defun doc-view-buffer-message () "rendering pdf..."))
  (setq doc-view-continuous t)
  (add-hook 'doc-view-mode-hook 'auto-revert-mode)

  ;;------------------------------------------------------------
  ;;----------------------LATEX---------------------------------
  ;;------------------------------------------------------------
  ;;awesome org-mode bib ref thing

  (setq org-ref-completion-library 'org-ref-ivy-cite)
  (require 'org-ref)
  
  ;; Big hack to insert biblio entry titles
  ;; unelegant simply because I do not really know LISP
  ;; adapted from: http://www.mail-archive.com/emacs-orgmode@gnu.org/msg110385.html

  (defun set-format (key)
    (setf (cdr (assoc key (cdr (assoc "org"
                                         org-ref-formatted-citation-formats))))
          "${author} ${year}. /${title}/. [[cite:${=key=}]]")
      )
  (setq org-ref-formatted-citation-backend "org")
  (set-format "article")
  (set-format "inproceedings")
  (set-format "book")
  (set-format "phdthesis")
  (set-format "inbook")
  (set-format "incollection")
  (set-format "proceedings")
  (set-format "unpublished")

  ;; Snippets (notes)
  ;; <py creates an ob-ipython code block

  ;; set default latex engine to be xelatex
  ;(setq TeX-engine 'xetex)
  ;(setq TeX-PDF-mode t)
  ;;latex full-doc previews
  ;(add-hook 'doc-view-minor-mode-hook 'auto-revert-mode)
  (unless (boundp 'org-latex-classes)
    (setq org-latex-classes nil))
  (add-to-list 'org-latex-classes
                '("myreport"
                  "\\documentclass[a4paper,10pt]{report}
  \\usepackage[utf8]{inputenc}
  \\usepackage{amsmath}
  \\usepackage{amsfonts}
  \\usepackage{amssymb}
  \\usepackage{hyperref}
  \\usepackage[left=2.5cm,right=2.5cm,top=2.5cm,bottom=2.5cm]{geometry}
  \\usepackage{fontspec}
  \\setmainfont{Linux Biolinum}
  "))

  (setq org-latex-create-formula-image-program 'dvipng)
  ;(latex :variables latex-build-command "pdflatex")

  ;; enable PDF-LaTeX synchronization
  ;; press SPC m v to highlight line in PDF
  ;; press shift cmd and click in PDF to show line in sourcecode
  (setq TeX-source-correlate-mode t)
  (setq TeX-source-correlate-start-server t)
  (setq TeX-source-correlate-method 'synctex)
  ;(setq org-latex-to-pdf-process '("latex %f && bibtex %f && latex %f && latex %f"))
  (setq org-latex-pdf-process
        '("pdflatex -interaction nonstopmode -output-directory %o %f"
          "bibtex %b"
          "pdflatex -interaction nonstopmode -output-directory %o %f"
          "pdflatex -interaction nonstopmode -output-directory %o %f"))
  ;;(setq org-latex-to-pdf-process (list "latexmk -pdf %f"))
  ;; RefTeX stuff
  (setq reftex-bibliography-commands '("bibliography" "nobibliography" "addbibresource"))
  '(reftex-use-external-file-finders t)
  ; Turn on RefTeX for AUCTeX, http://www.gnu.org/s/auctex/manual/reftex/reftex_5.html
  (add-hook 'LaTeX-mode-hook 'turn-on-reftex)
  ; Make RefTeX interact with AUCTeX, http://www.gnu.org/s/auctex/manual/reftex/AUCTeX_002dRefTeX-Interface.html
  (setq reftex-plug-into-AUCTeX t)

  (setq bibtex-completion-format-citation-functions
        '((org-mode      . bibtex-completion-format-citation-cite) ;org-link-to-PDF)
          (latex-mode    . bibtex-completion-format-citation-cite)
          (markdown-mode . bibtex-completion-format-citation-pandoc-citeproc)
          (default       . bibtex-completion-format-citation-default)))

  (defun org-mode-reftex-setup ()
    (load-library "reftex")
    ;(interactive)
    (and (buffer-file-name) (file-exists-p (buffer-file-name))
         (progn
                                        ;enable auto-revert-mode to update reftex when bibtex file changes on disk
           (global-auto-revert-mode t)
                                        ;(setq TeX-master t)
                                        ; (turn-on-reftex)
           (reftex-parse-all) 
                                        ;add a custom reftex cite format to insert links
           (reftex-set-cite-format
            '((?c . "cite:%l")
              (?t . "%t")
              (?h . "*** %a, %y, %t cite:%l\n")
              (?a . "%a")
              (?y . "%y")
              (?m . "| %a | %y |  %t |  cite:%l |")))))
    (define-key org-mode-map (kbd "C-c )") 'reftex-citation)
    (define-key org-mode-map (kbd "C-c 0") 'org-mode-reftex-search))
  (setq org-support-shift-select t)
  (message "Adding ORG mode helpers")

  ;; (define-key org-mode-map (kbd "C-c (") 'org-mode-reftex-search))

  (add-hook 'org-mode-hook 'org-mode-reftex-setup)
  (add-hook 'org-mode-hook 'turn-on-auto-fill)

  (setq python-shell-prompt-detect-failure-warning nil)

  ;;------------------------------------------------------------
  ;;----------------------BABEL---------------------------------
  ;;------------------------------------------------------------
  ;; load python and gnu calc so it can be run inline
  (org-babel-do-load-languages
   'org-babel-load-languages
   '(
     (python . t)
     (calc . t)
     (ipython . t)
     (octave . t)
     (matlab . t)
     )
   )

  (setq org-edit-src-content-indentation 0
        org-src-preserve-indentation t
        org-src-tab-acts-natively t
        org-src-fontify-natively t
        org-confirm-babel-evaluate nil
        org-support-shift-select 'always)

  (add-hook 'org-babel-after-execute-hook 'org-display-inline-images 'append)

  ;;------------------------------------------------------------
  ;;----------------------org-mode------------------------------
  ;;------------------------------------------------------------
  
  ;(setq org-src-block-faces '(("emacs-lisp" (:background "#112233"))
  ;                            ("python" (:background "#2221ff"))
  ;                            ("ipython" (:background "#222222"))))

  ;; disable evaluation security (just run the damn thing)
  (setq org-confirm-babel-evaluate nil)
  ;; when capturing new notes, place them in notes.org sub orgfile in org-directory
  ; (setq org-directory "~/notes/")
  (setq org-support-shift-select 'always)

  (require 'ox-md nil t)
  ;(require 'ox-bibtex)
  (with-eval-after-load 'ox
    (require 'ox-pandoc)
    )
  ;;------------------------------------------------------------
  ;;--------------------make ` -> ~ in org----------------------
  ;;------------------------------------------------------------
  (defun swap-tilda-backtick ()
    (interactive)
    (insert "~"))

  ;(define-key org-mode-map (kbd "`") 'swap-tilda-backtick)

  ;;------------------------------------------------------------
  ;;------------------HUGO blog post steup----------------------
  ;;------------------------------------------------------------
  ;; From http://www.holgerschurig.de/en/emacs-blog-from-org-to-hugo/
  (defun hugo-ensure-property (property)
    "Make sure that a property exists. If not, it will be created.

Returns the property name if the property has been created,
otherwise nil."
    (if (org-entry-get nil property)
        nil
      (progn (org-entry-put nil property "")
             property)))

  (defun hugo-ensure-properties ()
    "This ensures that several properties exists. If not, these
properties will be created in an empty form. In this case, the
drawer will also be opened and the cursor will be positioned
at the first element that needs to be filled.
Returns list of properties that still must be filled in"
    (require 'dash)
    (let ((current-time (format-time-string (org-time-stamp-format t t) (org-current-time)))
          first)
      (message "STart excursion")
      (save-excursion
        (unless (org-entry-get nil "TITLE")
          (org-entry-put nil "TITLE" (nth 4 (org-heading-components))))
        (setq first (--first it (mapcar #'hugo-ensure-property '("HUGO_TAGS" "HUGO_TOPICS" "HUGO_FILE"))))
        (unless (org-entry-get nil "DRAFT")
          (org-entry-put nil "DRAFT" "true"))
        (unless (org-entry-get nil "HUGO_DATE")
          (org-entry-put nil "HUGO_DATE" current-time)))

      (when first
        (goto-char (org-entry-beginning-position))
        ;; The following opens the drawer
        (forward-line 1)
        (beginning-of-line 1)
        (when (looking-at org-drawer-regexp)
          (org-flag-drawer nil))
        ;; And now move to the drawer property
        (search-forward (concat ":" first ":"))
        (end-of-line))
      (message first)
      first))

  (defun hugo ()
    (interactive)
    (message "Exporting Hugo")
  (unless (hugo-ensure-properties)
    (let* ((title    (concat "title = \"" (org-entry-get nil "TITLE") "\"\n"))
           (date     (concat "date = \"" (format-time-string "%Y-%m-%d" (apply 'encode-time (org-parse-time-string (org-entry-get nil "HUGO_DATE"))) t) "\"\n"))
           (topics   (concat "topics = [ \"" (mapconcat 'identity (split-string (org-entry-get nil "HUGO_TOPICS") "\\( *, *\\)" t) "\", \"") "\" ]\n"))
           (tags     (concat "tags = [ \"" (mapconcat 'identity (split-string (org-entry-get nil "HUGO_TAGS") "\\( *, *\\)" t) "\", \"") "\" ]\n"))
           (draft    (concat "draft = " (org-entry-get nil "DRAFT") "\n"))
           (fm (concat "+++\n"
                       title
                       date
                       tags
                       topics
                       draft
                       "+++\n\n"))
           (message "setting file")
           (file     (org-entry-get nil "HUGO_FILE"))
           (coding-system-for-write buffer-file-coding-system)
           (backend  'html)
           (blog))
      
      (message "Starting export")
      (setq blog (org-export-as backend t))
      ;; Normalize save file path
      ;(unless (string-match "^[/~]" file)
      ;  (setq file (concat hugo-content-dir file))
      (unless (string-match "\\.html$" file)
        (setq file (concat file ".html")))

      ;;(message (file-name-directory file))
      ;; image folder
      (setq impath 
                    (concat (file-name-directory file) (file-name-sans-extension (file-name-nondirectory file)))
                    
            )
      (message "Image path is")
      (message impath)

      ;; force create it
      (make-directory impath "yes")
      ;; get files
      (setq png-files (directory-files
                       (file-name-directory (buffer-file-name))
                       nil "\\.png$") )
      ;; find all images (png) in current file directory and copy to image path
      (mapcar '(lambda (f)
                 (copy-file f (concat impath "/" (file-name-nondirectory f)) "yes"
                 ))
              png-files
            )
      ;; save html
      (with-temp-buffer
        (insert fm)
        (insert blog)
        ;(untabify (point-min) (point-max))
        (write-file file)
        (message "Exported to %s" file))
      )))

  (define-key org-mode-map (kbd "M-g h") 'hugo)

  ;; Remove title centering
  (setq
   org-html-head-extra
   (concat
    org-html-head-extra
     "<style type=\"text/css\">\n .title {text-align: left} \n .subtitle {text-align: left}\n</style>\n"
    ))
  ;;------------------------------------------------------------
  ;;----------------------display-stuff-------------------------
  ;;------------------------------------------------------------
  ;; turn on visual-line-mode in text modes only
  (add-hook 'text-mode-hook 'turn-on-visual-line-mode)

  ;;-------------------------------------------------------------
  ; (setq deft-directory "~/notes")
  )
(add-hook 'after-init-hook 'global-company-mode)

;; Don't modify past this
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#252525" "#D9D9D9" "#C2C2C2" "#F6F6F6" "#E8E8E8" "#D9D9D9" "#F0F0F0" "#F6F6F6"])
 '(ansi-term-color-vector
   [unspecified "#081724" "#ff694d" "#68f6cb" "#fffe4e" "#bad6e2" "#afc0fd" "#d2f1ff" "#d3f9ee"] t)
 '(custom-enabled-themes (quote (clues)))
 '(custom-safe-themes
   (quote
    ("8ec2e01474ad56ee33bc0534bdbe7842eea74dccfb576e09f99ef89a705f5501" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" default)))
 '(evil-want-Y-yank-to-eol t)
 '(fci-rule-character-color "#d9d9d9")
 '(fci-rule-color "#161616" t)
 '(fringe-mode 10 nil (fringe))
 '(linum-format " %6d ")
 '(main-line-color1 "#222232")
 '(main-line-color2 "#333343")
 '(matlab-shell-command-switches (quote ("-nodesktop -nosplash")))
 '(package-selected-packages
   (quote
    (request-deferred deferred racer cargo wolfram-mode thrift stan-mode scad-mode qml-mode matlab-mode julia-mode arduino-mode web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc company-tern tern coffee-mode \(\\\,\ sunny-day\)-theme zonokai-theme zen-and-art-theme underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tronesque-theme toxi-theme tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme subatomic256-theme subatomic-theme spacegray-theme soothe-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme seti-theme reverse-theme railscasts-theme purple-haze-theme professional-theme planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme pastels-on-dark-theme organic-green-theme omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme niflheim-theme naquadah-theme mustang-theme monokai-theme monochrome-theme molokai-theme moe-theme minimal-theme material-theme majapahit-theme lush-theme light-soap-theme jbeans-theme jazz-theme ir-black-theme inkpot-theme heroku-theme hemisu-theme hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme gandalf-theme flatui-theme flatland-theme firebelly-theme farmhouse-theme espresso-theme dracula-theme django-theme darktooth-theme autothemer darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes afternoon-theme rainbow-mode rainbow-identifiers color-identifiers-mode zenburn-theme ein websocket pdf-tools tablist pandoc-mode ox-pandoc ht xterm-color shell-pop multi-term eshell-z eshell-prompt-extras esh-help yapfify yaml-mode wgrep web-mode tagedit smex smeargle slim-mode scss-mode sass-mode reveal-in-osx-finder ranger pyvenv pytest pyenv-mode py-isort pug-mode pip-requirements pbcopy osx-trash osx-dictionary orgit org-ref key-chord org-projectile org-present org org-pomodoro alert log4e gntp org-download ob-ipython dash-functional mmm-mode markdown-toc markdown-mode magit-gitflow live-py-mode less-css-mode launchctl ivy-hydra hy-mode htmlize helm-bibtex parsebib haml-mode gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md evil-magit magit magit-popup git-commit with-editor emmet-mode disaster deft cython-mode counsel-projectile counsel swiper ivy company-web web-completion-data company-statistics company-c-headers company-auctex company-anaconda company cmake-mode clang-format biblio biblio-core auto-yasnippet yasnippet auctex-latexmk auctex anaconda-mode pythonic ac-ispell auto-complete ws-butler window-numbering which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide ido-vertical-mode hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav dumb-jump f s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed dash aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async quelpa package-build spacemacs-theme)))
 '(powerline-color1 "#222232")
 '(powerline-color2 "#333343")
 '(vc-annotate-background "#0E0E0E")
 '(vc-annotate-color-map
   (quote
    ((20 . "#616161")
     (40 . "#9D9D9D")
     (60 . "#9D9D9D")
     (80 . "#C2C2C2")
     (100 . "#C2C2C2")
     (120 . "#D9D9D9")
     (140 . "#D9D9D9")
     (160 . "#E8E8E8")
     (180 . "#E8E8E8")
     (200 . "#E8E8E8")
     (220 . "#F0F0F0")
     (240 . "#F0F0F0")
     (260 . "#F0F0F0")
     (280 . "#F6F6F6")
     (300 . "#F6F6F6")
     (320 . "#F6F6F6")
     (340 . "#F9F9F9")
     (360 . "#F9F9F9"))))
 '(vc-annotate-very-old-color "#D9D9D9"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
