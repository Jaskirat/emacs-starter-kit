;;In the beginning God created the computer and the keyboard
;;And the computer was without form, and void; and darkness was upon
;;the face of software .
;;And then God said, "let there be Emacs!"

(require 'package)
(dolist (source '(("melpa" . "https://melpa.org/packages/")
 		  ("marmalade" . "http://marmalade-repo.org/packages/")
                  ("elpa" . "http://tromey.com/elpa/")))
  (add-to-list 'package-archives source t))
(package-initialize)

;;Refresh the archive
(when (not package-archive-contents)
  (package-refresh-contents))

;;List of packages that are supposed to be present
;;Order elpa packages before starter-kit package

(defvar my-packages '(load-dir
                      clojure-mode
                      clojurescript-mode
                      swank-clojure
                      slime
                      magit
                      volatile-highlights
                      ac-slime
                      auto-complete
                      undo-tree
                      starter-kit
                      starter-kit-lisp
                      starter-kit-bindings
                      starter-kit-js
                      starter-kit-ruby
                      cider
                      ac-nrepl)
  "A list of packages to ensure are installed at launch.")

;; Go get my packages that aren't already there!
(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; Easy way to load full directory of elisp files
(require 'load-dir)
(setq dotfiles-root-dir (file-name-directory
                     (or (buffer-file-name) load-file-name)))

;;Load non elpa packages
;;File names numbering hack for Load order
(load-dir-one (concat dotfiles-root-dir "non-elpa"))

;; Bring on the package specific customizations
(load-dir-one (concat dotfiles-root-dir "pkg-configs"))

;;eval the below sexp when necessary from time to time *grin*
;;(byte-recompile-directory (expand-file-name "~/.emacs.d") 0)
