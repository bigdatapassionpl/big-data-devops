FROM jupyter/all-spark-notebook

# Install in the default python3 environment
RUN pip install --quiet --no-cache-dir 'flake8==3.9.2' && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"