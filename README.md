#ActiveMQ Subscriber
##Description
Helper to subscribe to an ActiveMQ topic
##Example
```
require 'activemq_subscriber'

subscriber=ActiveMQSubscriber.new("tcp://localhost:61616", "some-topic")
subscriber.messages
subscriber.close
```
