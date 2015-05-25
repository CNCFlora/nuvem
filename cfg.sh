#/bin/bash

curl -X PUT http://localhost:8500/v1/kv/consul-alerts/config/notifiers/slack/url -d 'https://hooks.slack.com/services/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'
curl -X PUT http://localhost:8500/v1/kv/consul-alerts/config/notifiers/slack/channel -d '#cncflora-monitor'
curl -X PUT http://localhost:8500/v1/kv/consul-alerts/config/notifiers/slack/username -d 'diogok'
curl -X PUT http://localhost:8500/v1/kv/consul-alerts/config/notifiers/slack/icon-emoji -d ':chart_with_downwards_trend:'
curl -X PUT http://localhost:8500/v1/kv/consul-alerts/config/notifiers/slack/enabled -d 'true'
