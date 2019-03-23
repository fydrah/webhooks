# Webhooks

Based on https://github.com/adnanh/webhook

## Usage
* [Helm](webhooks/README.md)

* Docker (testing only):

  ```shell
  docker run -it -v $(pwd)/scripts:/scripts -v $(pwd)/hooks.json:/config/hooks.json webhook
  ```
