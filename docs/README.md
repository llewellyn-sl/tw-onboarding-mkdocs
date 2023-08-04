## Technical writer onboarding docs 

This project contains internal documentation detailing the various documentation projects that technical writers at Seqera maintain. 

This README details the build flow for the onboarding docs. See [MkDocs build](./tower-docs/mkdocs.md) for instructions to build the Tower documentation locally. 

## High-Level Flow

1. Markdown content is stored in the `/docs` folder of the [**tw-onboarding-mkdocs**](https://github.com/llewellyn-sl/tw-onboarding-mkdocs) repository.
2. New content must be created in `feature branches` generated from `master`.

1. **Generate a token on <git.seqera.io> (i.e. "Gitea")**

    1. 
    2. Log in to [git.seqera.io](https://git.seqera.io) using your Seqera credentials
    3. In the top right menu, click on your avatar and select `Settings` from the drop-down menu
    4. Select `Applications` near the top of the page
    5. Generate a new token and copy the value after form submission
    6. Store the token value as a `GITEA_TOKEN` environment variable, optionally added to .bashrc/.zshrc. 
    7. Run `source .bashrc` or `source .zshrc` once saved.
    8. Alternatively, use an existing token (e.g., Llewellyn or Graham).

2. **Build docs image**

    The Dockerfile and other Docker build requirements are in the root of the repo. Docker build must be performed from the nf-tower-docs repo. You only need to do this once locally, unless structural or tooling changes are made to this repo.

    1. Clone [tw-onboarding-mkdocs](https://github.com/llewellyn-sl/tw-onboarding-mkdocs) locally if you have not done so already.
    2. Navigate to the root of nf-tower-docs. 
    3. Run the Docker build command:

    ```bash
    docker build --build-arg GITEA_TOKEN=${GITEA_TOKEN} -t tw-onboarding-docs .  # including the . at the end

    # Or, use a `make` command
    make build-docker
    ```

3. **Run the container**

    Once the `docker build` has succeeded, run the Docker container:

    1. Check out the feature branch you wish to preview on tw-onboarding-mkdocs.
    2. Navigate to `/docs`.
    3. Run the Docker run command:

    ```bash
    docker run --rm -p 8000:8000 -v ${PWD}:/docs tw-onboarding-docs:latest serve --dev-addr=0.0.0.0:8000
    ```

4. **Visit <http://0.0.0.0:8000> from your favorite browser**.


## Contribution guidelines

- Write according to the [content style guide](https://docs.google.com/document/d/1j8cQAtwJLW891TDBSDMYTy3Jcr4gRVxtqwcWzPCjTY4/edit?usp=sharing)


## Technical review guidelines

When assessing doc content for technical accuracy, keep in mind:

- How the content fits into our overall documentation and whether it is being added to the correct place.
- Whether the content can be simplified or streamlined in relation to existing content.
- Does the content instruct users according to best practices?
- Are there any edge cases or caveats that are helpful for users to know that should be added to the content?


## MkDocs mechanics

MkDocs is a powerful framework with many opportunities to extend functionality via plugins. Some packages have already been added to this project and affect how content is structured and referenced.

### Navigation

To update the navigation menu, edit the `navigation` section of the `mkdocs.yml` file in the root of the repo.