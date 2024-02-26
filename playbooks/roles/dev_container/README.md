Ansibe Role: Gitea
=========

Installs gitea and a database in rootless containers.

Requirements
------------

Role requires podman and netavark to be installed.

Role Variables
--------------
Port variables:

    gitea_publish_http: port that gitea web app listens on, default is "3000".
    gitea_publish_ssh: port that gitea internal ssh service listens, default is "2222".

Name of the podman network:

    gitea_net_name: gitea

User that gitea runs as:

    gitea_user_create: true
    gitea_user: name of the user that gitea will run under, default is git.

Images:

    gitea_db_image_name:  "docker.io/library/postgres".
    gitea_db_image_tag: "16-alpine"

    gitea_app_image_name: "docker.io/gitea/gitea"
    gitea_app_image_tag: "1.21-rootless"

Database variables: 

    gitea_db_type: postgres
    gitea_db_name: gitea
    gitea_db_user: gitea
    gitea_db_pass: password
    gitea_db_port: 5432

Dependencies
------------
Collections:

- containers.podman
- community.general

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
        - role: palekiwi.gitea_rootless
          vars:
            gitea_app_image_tag: 1.21-rootless
            gitea_db_image_tag: 16-alpine
            gitea_db_pass: secret

License
-------

BSD

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).
