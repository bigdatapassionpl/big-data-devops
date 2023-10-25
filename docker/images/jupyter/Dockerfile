# Start from a core stack version
FROM jupyter/all-spark-notebook:spark-3.5.0

USER root

# APT packages
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        sudo \
        vim \
        wget \
        curl \
        byobu \
        htop \
        tree \
        g++ \
        libpq-dev \
        sasl2-bin \
        libsasl2-2 \
        libsasl2-dev \
        libsasl2-modules \
        telnet \
        iputils-ping \
        ca-certificates \
        jq \
        awscli \
    && apt-get clean \
    && rm -rf \
        /var/lib/apt/lists/* \
        /tmp/* \
        /var/tmp/*

USER ${NB_UID}

# Install from requirements.txt file
COPY --chown=${NB_UID}:${NB_GID} requirements.txt /tmp/

RUN mamba install --yes \
    --file /tmp/requirements.txt \
    && mamba clean --all -f -y \
    && fix-permissions "${CONDA_DIR}" \
    && fix-permissions "/home/${NB_USER}"
