# Start from a core stack version
FROM jupyter/all-spark-notebook:2022-02-12

# Install from requirements.txt file
COPY --chown=${NB_UID}:${NB_GID} requirements.txt /tmp/
RUN mamba install --yes --file /tmp/requirements.txt && \
    mamba clean --all -f -y && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"