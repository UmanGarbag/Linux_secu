#BIND9

Mise en place d'un serveur dns avec bind9, ce repo contiendra les confs pour
le serveurs DNS ainsi que quelques explications.

Le fichier master.local contient les informations de la zone master, si vous
voulez reutiliser cet configuration , après avoir installer votre serveur
bind vous devez mettre ce fichier dans /var/named/.


Le fichier named.conf et le fichier de configuration de BIND9, c'est ici
qu'on déclare les zones master/slaves. Il est important de la configuré par
rapport à son besoin, la doc de RedHat et très complete je vous la conseil


https://access.redhat.com/documentation/fr-fr/red_hat_enterprise_linux/7/html/networking_guide/sec-bind
