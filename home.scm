(use-modules
  (guix gexp)
  (gnu home)
  (gnu home services)
  (gnu home services shells)
  (gnu home services ssh)
  (gnu services)
  (gnu packages)
  (gnu packages admin)
  (gnu packages shells)
  (gnu packages telegram)
  (gnu packages package-management)
  (gnu packages freedesktop)
  (gnu packages ssh))

(define %home-files
  `((".gitconfig" ,(local-file "gitconfig"))))

(home-environment
 (packages 
   (list 
     openssh
     htop 
     flatpak xdg-desktop-portal xdg-desktop-portal-gtk 
     zsh))
 (services
  (list
    (service home-files-service-type %home-files)
    (service home-zsh-service-type)
    (service home-openssh-service-type))))
