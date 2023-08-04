#######################################################################
#
#                        FOR DOCS DEVELOPMENT
#
# Command to test Tower docs when in the main nf-tower-cloud repo dir:
#   docker run --rm -p 8000:8000 -v ${PWD}/docs:/docs/docs seqera-docs:latest serve --dev-addr=0.0.0.0:8000
#
#######################################################################

FROM python:3.9
ARG GITEA_TOKEN
WORKDIR /docs

# Copy requirements.txt for installation
# Do it like this to help Docker cache layers - faster builds
COPY requirements.txt .

# Install mkdocs
RUN pip install -r requirements.txt && \
    pip install "git+https://${GITEA_TOKEN}@git.seqera.io/seqeralabs/mkdocs-material-insiders@7.3.3-insiders-3.1.3"

# Copy the rest of the website files into the current directory
COPY . .

ENTRYPOINT ["mkdocs"]
