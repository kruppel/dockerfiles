# Node.js wi Google Cloud SDK

Dockerfile for [Node.js](https://nodejs.org), with [Google Cloud SDK](https://cloud.google.com/sdk/).

Useful as a base image on CircleCI to support deployment tasks. See https://circleci.com/docs/2.0/deployment_integrations/#google-cloud for more details.

## Running the container

```sh
# To run
$ docker run -it kruppel/node-gcp:8-alpine \
  -l node-gcp \
  -e GCLOUD_PROJECT_ID=example-project \
  -e GCLOUD_COMPUTE_ZONE=us-central1-b \
  -e GCLOUD_SERVICE_KEY=<key>

# To deploy
$ docker exec $(docker ps -f 'label=node-gcp' --format '{{.ID}}') \
  _deploy gcr.io/org-name/project-name $CIRCLE_SHA1
```

From above, the expectation is that the service key is a Base64-encoded string representing the content of a service account key file (originally in JSON).

## Example

.circleci/config.yml:

```yml
version: 2
jobs:
  build:
    working_directory: /ui
    docker:
      - image: kruppel/node-cci-gcp:8-alpine
    steps:
      - checkout
      - run: mkdir -p /ui/artifacts
      - run: yarn install
      - run: yarn test
      - store_artifacts:
          path: /ui/artifacts
      - deploy:
          command: |
            if [ "${CIRCLE_BRANCH}" == "master" ]; then
              _deploy gcr.io/org-name/project-name $CIRCLE_SHA1
            fi
```
