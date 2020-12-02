A simple demo.

Everything runs with podman (a docker nearly build-in replacement).

To run:
- `git clone git@github.com:elefan-grenoble/gestion-compte.git`
- fill a `secret_env` file with relevant info (to be documented)
- `mkdir mariadb_data`
- run ./pod.sh

Note: the domain used to access the website must be specified in parameters.yml.inc at the `router.request_context.host` variable to get sessions cookie correctly working.
