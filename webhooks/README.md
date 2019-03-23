# Webhooks

This helm chart deploy a simple webhook server.

The chart allows users to setup simple hooks directly in chart
configuration, but also to use your own hooks executable (for
this, you will have to rebuild the
[Docker image](https://github.com/fydrah/webhooks/)

## Configuration

* hooks configuration:

```yaml
# JSON configuration.
#
# See https://github.com/adnanh/webhook/blob/master/docs/Hook-Examples.md
# hooksConfig: |
#   [
#     {
#       "id": "myotherhook"
#       "execute-command": "/scripts/raw/myotherhook"
#     }
#   ]
```

* hooks scripts setups. Scripts will be available in `/scripts/raw/` directory:

```yaml
# Dict of raw hooks scripts.
#
# key is webhook name, value is script content
# Only shell and python3 scripts are supported.
rawHooks: {}
  # myfirsthook: |
  #   #!/bin/bash
  #   echo "Hello World!"
  # myotherhook: |
  #   #!/usr/bin/env python
  #   print("Hello World!")
```

## Install

```shell
helm repo add fydrah https://charts.fhardy.fr
helm install fydrah/webhooks
```
