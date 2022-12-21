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
  (gnu packages commencement)
  (gnu packages imagemagick)
  (gnu packages cmake)
  (gnu packages llvm)
  (gnu packages linux)
  (gnu packages python-xyz)
  (gnu packages virtualization)
  (gnu packages unicode)
  (gnu packages xorg)
  (gnu packages rsync)
  ;(gnu packages wine)
  (nongnu packages messaging)
  ;(nongnu packages chromium)
  ;(nongnu packages wine)
  (brandhout packages vscodium)
  (chromium chromium)
  ;(mohamed packages crates)
)

(define %home-files
  `(
     (".gitconfig" ,(local-file "gitconfig"))
     ;(".config/nix/nix.conf" ,(local-file "nix.conf"))
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
     ;zsh
     rust 
     ;rust-cargo-0.65 ;; from custom channel
     ;python
     python-toolchain ;jupyter guix-jupyter
     node
     weechat ; irc chat
     gimp ; pictures editing
     obs ; recording
     testdisk ; repair disk
     xournalpp ; edit pdf
     poppler ; combine pdf
     imagemagick ; pdf to jpeg
     zoom ;; visio conference
     gcc-toolchain ;; gcc
     linux-libre-headers
     ;clang-toolchain
     cmake ;; cmake
     unicode-emoji
     xhost
     vscodium
     ;wine winetricks
     ;chromium
     chromium+drm
     virt-manager ;; virtual machine manager
     rsync
))
 (services
  (list
    (service home-files-service-type %home-files)
    (service home-bash-service-type
      (home-bash-configuration ;))
             (guix-defaults? #t)
             (bash-profile (list (plain-file "bash-profile" "\
export HISTFILE=$XDG_CACHE_HOME/.bash_history")))))

    ;(service home-zsh-service-type
    ;  (home-zsh-configuration 
    ;    (zshrc %zsh-file)))
    (service home-openssh-service-type))))
