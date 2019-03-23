# Webhooks

This helm chart deploy a simple webhook server.

The chart allows users to setup simple hooks directly in chart
configuration, but also to use your own hooks executable (for
this, you will have to rebuild the
[Docker image](https://github.com/fydrah/webhooks/)

## Configuration

* Raw hook configuration:

```yaml
# Dict of raw webhooks scripts.
#
# key is webhook name, value is script content
# Only shell and python3 scripts are supported.
rawWebhooks:
  myfirstwebhook: |
    #!/bin/bash
    echo "Hello World!"
  myotherwebhook: |
    #!/usr/bin/env python
    print("Hello World!")
```


* Extra hooks configuration (needs docker image rebuild):

```yaml
image:
  repository: your/image
  tag: v1.0.0
# Dict of extra webhooks
#
# Useful if you rebuild webhooks image,
# and add your own binaries of scripts.
#
# key is webhook name, value is executable path.
extraWebhooks:
  myownexecutable: "/helloworld"
```

## Install

```shell
helm repo add fydrah https://charts.fhardy.fr
helm install fydrah/webhooks
```
