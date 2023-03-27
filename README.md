# Projet LTC
**Travail fait en binome: Mariam Wehbe et Ibrahim Ndiaye**

## Tâche 0
On a créé la machine virtuelle 148.60.11.102
puis on a demandé l’accès externe vers le port 80 (http) et 443 (https) de votre machine virtuelle par le helpdesk, catégorie ISTIC-ESIR - Tous problèmes informatiques
et on a demandé le sous-domaine midoodle de diverse-team.fr pour la machine.

Le nom de domaine de notre machine est: mwehbe.istic.univ-rennes1.fr

on a accédé à la machine virtuelle par SSH:
sudo ssh zprojet@148.60.11.102 -p22

## Tâche 1
**Fournir un ou plusieurs docker file(s) et un ou plusieurs docker compose(s) pour cette application permettant de facilement déployer et configurer l’application**
on a utiisé un dockerfile pour le front, un dockerfile our l'api, et un dockercompose pour lancer notre application.

## Tâche 2 
on a ajouté la configuration des serveurs dans le repertoire exampleconfd
doodle.conf
myadmin.conf
pad.conf

On lance le fichier dockercompose pour l'exécution: 
docker-compose up

on va accéder par web via le lien: http://mwehbe.istic.univ-rennes1.fr/

## Tâche 3

**Configuration du fichier etc/hosts de la machine virtuelle:**
148.60.11.102 mwehbe.istic.univ-rennes1.fr pad.mwehbe.istic.univ-rennes1.fr myadmin.mwehbe.istic.univ-rennes1.fr grafana.mwehbe.istic.univ-rennes1.fr prometheus.mwehbe.istic.univ-rennes1.fr

**Configuration letsencrypt** sur la machine virtuelle par les commandes suivantes:
sudo apt-get update
sudo apt-get install certbot
sudo certbot certonly --standalone -d mwehbe.istic.univ-rennes1.fr

**Installation du firewall ufw sur la machine virtuelle**
https://codedesign.fr/tutorial/firewall-facile-serveur-ufw/

on a vérifié que le firewall existe déjà sur notre machine, mais il était inactif. on l'a activé et configuré comme suivant:
ufw status verbose
ufw default deny incoming
ufw default deny outgoing
ufw allow in 80/tcp
ufw allow in 443/tcp
ufw allow out 80/tcp 
ufw allow out 443/tcp
ufw allow in 22/tcp
ufw allow out 25/tcp
ufw allow out 53/udp
ufw enable

puis on a vérifié les paramètres de la configuration:
ufw status verbose

## Tâche 4
Le diagramme de déploiement réalisé pour le moment sur notre machine virtuelle

![](https://codimd.math.cnrs.fr/uploads/upload_536c06d7154e0d417f575e4f6951c06a.png)

## Tâche 6 
On a ajouté les configurations dans le fichier dockercompose pour le monitoring de l’application à l’aide de Promotheus, grafana et munin


L'application est accessible par les liens suivants:

https://mwehbe.istic.univ-rennes1.fr
https://mwehbe.istic.univ-rennes1.fr/etherpad
https://mwehbe.istic.univ-rennes1.fr/phpmyadmin/
