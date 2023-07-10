FROM docker:20.10.20-cli

COPY --from=atlassian/pipelines-kubectl:1.24.2 /usr/local/bin/kubectl /usr/local/bin/kubectl
