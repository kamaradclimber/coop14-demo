## Mise en place d'une oauth pour Odoo

* Utiliser le patch https://github.com/kamaradclimber/gestion-compte/commit/9d696c19d8e0a2994c60d6aeb86e60bf77613e3e créant l'api exposant le modèle attendu par Odoo.
* dans GestionCompte, en tant que super admin: Administration -> Gérer les client OAuth
* créer un nouveau client dont les paramètres sont:
  * `http://<odoo_url>/auth_oauth/signin`
  * tous les types de permissions (TODO: à rafiner)
* Après enregistrement, seul la clé publique sera utilisée
* toujours dans GestionCompte: Administration -> Gérer les services. Ajouter un nouveau service dont l'url est exactement la même que pour le client créé précédement.
* dans Odoo: Settings -> General Settings -> OAuth Authentication -> OAuth Providers, cliquer sur Create. Paramètres:
  * Client ID: clé publique obtenue dans GestionCompte
  * Allowed: à cocher
  * Body: "Se connecter avec Coop14"
  * Authentication URL: `https://<url gestion membre>/oauth/v2/auth`
  * Scope: `oauth_login` (seule valeur autorisée, pour le futur il s'agit d'une liste séparée par des espaces)
  * Validation URL: `https://<url gestion membre>/api/oauth/odoo_user` (ajoutée par le patch mentionné au début du doc)
  * Data URL: vide

Limitations:
* Il est possible de créer (créer seulement) des comptes dans Odoo en se connectant à Odoo via l'oauth.
* Pour le moment, l'instance Odoo de Coop14 permet la création du compte mais aucun droit n'est donné.
