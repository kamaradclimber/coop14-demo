# This file is a "template" of what your parameters.yml file should look like
# Set parameters here that may be different on each deployment target of the app, e.g. development, staging, production.
# https://symfony.com/doc/current/best_practices/configuration.html#infrastructure-related-configuration
parameters:
    database_host: 127.0.0.1
    database_port: 3306
    database_name: __MYSQL_DATABASE__
    database_user: __MYSQL_USER__
    database_password: __MYSQL_PASSWORD__

    super_admin.username: coop14
    super_admin.initial_password: default_password

    mailer_transport: smtp
    mailer_host: 127.0.0.1
    mailer_port: 25
    mailer_user: ~
    mailer_password: ~
    mailer_encryption: null

    # mail user used for transactional
    transactional_mailer_user: 'contact@coop14.fr'
    transactional_mailer_user_name: 'espace membre'


    # The base domain used for mail addresses
    emails.base_domain: coop14.fr

    # Several email addresses, to be used as an associative array
    emails.contact:
        from_name: 'Contact Coop14'
        address: contact@coop14.fr
    emails.member:
        from_name: 'Membres Coop14'
        address: membres@coop14.fr
    emails.shift:
        from_name: 'Créneaux Coop14'
        address: creneaux@coop14.fr
    emails.formation:
        from_name: 'Formation Coop14'
        address: formations@coop14.fr
    emails.admin:
        from_name: 'Admin Coop14'
        address: admin@coop14.fr
    emails.noreply:
        from_name: 'Ne pas répondre'
        address: noreply@coop14.fr

    # Available emails in some mailing forms
    emails.sendable:
        - "%emails.contact%"
        - "%emails.member%"
        - "%emails.shift%"
        - "%emails.formation%"
        - "%emails.admin%"
        - "%emails.noreply%"

    shift_mailer_user: ~

    # A secret key that's used to generate certain security-related tokens
    secret: __SYMFONY_SECRET__

    #router https://symfony.com/doc/3.4/console/request_context.html
    router.request_context.host: coop14-demo.familleseux.net
    router.request_context.scheme: https
    router.request_context.base_url:

    # Branding
    site_name: Espace membre Coop 14
    project_name: Coop 14
    project_url: https://coop14.fr/
    project_url_display: coop14.fr
    main_color: #51CAE9
    local_currency_name: 'monnaie locale'
    #ip of the spot, comma separated if many
    place_local_ip_address: '127.0.0.1,192.168.0.x'

    wiki_keys_url: ~

    # Registration
    registration_duration: '1 year'
    helloasso_registration_campaign_url: https://www.helloasso.com/associations/my-local-coop/adhesions/re-adhesion
    helloasso_campaign_id:
    helloasso_api_key:
    helloasso_api_password:
    helloasso_api_base_url: https://api.helloasso.com/v3/

    # Shifting configuration
    due_duration_by_cycle: 180
    min_shift_duration: 90
    cycle_duration: '28 days'
    maximum_nb_of_beneficiaries_in_membership: 2
    new_users_start_as_beginner: true
    unlimited_book_duration: false
    display_gauge: true
    use_fly_and_fixed: false

    logging.mattermost.enabled: false
    logging.mattermost.level: 'critical'
    logging.mattermost.url: 'http://mattermost.coop14.fr'
    logging.mattermost.channel: ~

    logging.swiftmailer.enabled: false
    logging.swiftmailer.level: 'critical'
    logging.swiftmailer.recipient: ~


    code_generation_enabled: true
