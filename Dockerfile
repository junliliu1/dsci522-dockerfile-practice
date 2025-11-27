# Dockerfile for dsci522-dockerfile-practice
# Extends the Jupyter minimal-notebook image

FROM quay.io/jupyter/minimal-notebook:afe30f0c9ad8

# Copy the conda lock file into the container
COPY conda-linux-64.lock /tmp/conda-linux-64.lock

# Install packages from the lock file
RUN conda install --file /tmp/conda-linux-64.lock && \
    conda clean --all -y && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"
