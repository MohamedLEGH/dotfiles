(use-modules
  (guix gexp)
  (gnu home)
  (gnu home services)
  (gnu home services shells)
  (gnu home services ssh)
  (gnu services)
  (gnu packages)
  (gnu packages tex)
  (gnu packages base)
  (gnu packages admin)
  (gnu packages shells)
  (gnu packages telegram)
  (gnu packages package-management)
  (gnu packages freedesktop)
  (gnu packages libreoffice)
  (gnu packages video)
  (gnu packages ssh)
  (gnu packages rust)
  (gnu packages crates-io)
  (gnu packages python)
  (gnu packages node)
  (gnu packages irc)
  (gnu packages gimp)
  (gnu packages disk)
  (gnu packages pdf)
  (gnu packages imagemagick))

(define %home-files
  `(
     (".gitconfig" ,(local-file "gitconfig"))
   )
)

(define %zsh-file
  `(
     ,(local-file "zshrc")
   )
)

(home-environment
 (packages 
   (list 
     vlc
     shotcut
     openshot
     texlive-base
     gnu-make
     openssh
     htop
     libreoffice
     flatpak
     zsh
     rust 
     rust-cargo-0.53
     python
     node
     weechat ; irc chat
     gimp ; pictures editing
     obs ; recording
     testdisk ; repair disk
     xournalpp ; edit pdf
     poppler ; combine pdf
     imagemagick ; pdf to jpeg
     nix ; package manager
))
 (services
  (list
    (service home-files-service-type %home-files)
    (service home-zsh-service-type
      (home-zsh-configuration 
        (zshrc %zsh-file)))
    (service home-openssh-service-type))))
