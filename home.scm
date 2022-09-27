(use-modules
  (guix gexp)
  (gnu home)
  (gnu home services)
  (gnu home services shells)
  (gnu services)
  (gnu packages)  
  (gnu packages admin)
  (gnu packages shells)
  (gnu packages telegram)
  (gnu packages package-management)
  (gnu packages freedesktop))

(define %home-files
;;  (map normalize-config
;;       '(("gitconfig" . ".gitconfig"))))
;  '(("gitconfig" . ".gitconfig")))
`((".gitconfig" ,(local-file "gitconfig"))))

(home-environment
 (packages 
   (list 
     htop 
     flatpak xdg-desktop-portal xdg-desktop-portal-gtk 
     zsh))
 (services
  (list
;    (simple-service 'some-useful-env-vars-service
;		home-environment-variables-service-type
;		`(("GIT_AUTHOR_NAME" . "Mohamed Amine LEGHERABA")
;                  ("GIT_AUTHOR_EMAIL" . "mlegheraba@protonmail.com")
;                 ))
    (service home-files-service-type %home-files)
    (service home-zsh-service-type)
;               (home-zsh-configuration
;                 (environment-variables 
;		   '(("GIT_AUTHOR_NAME" . "Mohamed Amine LEGHERABA")
;                     ("GIT_AUTHOR_EMAIL" . "mlegheraba@protonmail.com")
;                 ))
;))
)))
;    (service home-bash-service-type
;            (home-bash-configuration
;             (guix-defaults? #t)
;             (bash-profile (list (plain-file "bash-profile" "\
;export HISTFILE=$XDG_CACHE_HOME/.bash_history"))))))))
