Pour utiliser la démo du site de gestion des comptes "Elefant":
- se connecter en tant qu'administrateur avec les infos de https://coop14e.slack.com/archives/C01FGD4RXHN/p1606939679002500?thread_ts=1606377745.006200&cid=C01FGD4RXHN
- sur son ordinateur, créer un fichier appelé "import.csv" (le format csv est important) qui avec deux lignes:
```
numero,nom,prénom,adresse,code postal,commune,N/A,téléphone,email,Commissions,A associer à (email),montant
17,seux,gregoire,quelquepart,75014,paris,,,monemail@gmail.com,,,
```
Le numero, pour le moment, doit être mis au hasard pour éviter de rentrer en conflit avec les autres comptes). La première ligne doit être présente telle quelle, la seconde adaptée évidemment à votre cas
- Ouvrir la page https://coop14-demo.familleseux.net/admin/importcsv, cliquer sur "Fichier csv", choisir le fichier import.csv et cliquer sur "Importer". L'utilisateur devrait être visible dans https://coop14-demo.familleseux.net/admin/users.
- sur https://coop14-demo.familleseux.net/admin/users, cliquer sur le nouvel utilisateur et cliquer sur le bouton "activer le compte de ..."
- le mail d'activation n'est pas envoyé à votre adresse mais est visible sur https://coop14-demo.familleseux.net/mailcatcher, il faut activer le compte et choisir un mot de passe (deux fois apparement)
- après avoir lu le mail, il faut le *supprimer*

La procédure est un peu compliquée pour le moment car nous n'avons pas encore de numéro assigné. Une fois que ca sera le cas, l'enregistrement sera très similaire à un site classique.
