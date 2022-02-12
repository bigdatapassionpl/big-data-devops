
* https://github.com/getredash/contrib-helm-chart

~~~shell
export HELM_REPO_NAME=redash
export HELM_REPO_URL=https://getredash.github.io/contrib-helm-chart/
export HELM_CHART=redash/redash

cat > $HELM_DIR/values.yaml <<- EOM
redash:
  cookieSecret: $(openssl rand -base64 32)
  secretKey: $(openssl rand -base64 32)
postgresql:
  postgresqlPassword: $(openssl rand -base64 32)
redis:
  password: $(openssl rand -base64 32)
EOM

~~~