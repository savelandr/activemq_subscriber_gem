require 'java'
require 'activemq'

# Class to subscribe to an ActiveMQ topic and present the messages nicely
class ActiveMQSubscriber


  def initialize(connection_string, topic)
    @messages = []
    @connection_string = connection_string
    @topic = topic
    @connection_factory = Java::OrgApacheActivemq::ActiveMQConnectionFactory.new(@connection_string)
    @connection = @connection_factory.create_connection
    @session = @connection.create_session(false, Java::JavaxJms::Session::AUTO_ACKNOWLEDGE)
    @connection.start
    topic = Java::OrgApacheActivemqCommand::ActiveMQTopic.new @topic
    @subscriber = @session.create_subscriber(topic)
    message_handler = MessageHandler.new(@messages)
    @subscriber.set_message_listener(message_handler)
  end

  def messages
    @messages
  end

  def clear_messages
    @messages.clear
  end

  def close
    @subscriber.stop
    @subscriber.close
    @session.stop
    @session.close
    @connection.stop
    @connection.close
  end

  class MessageHandler
    def initialize(queue)
      @queue = queue
    end

    def onMessage(message)
      @queue << message
    end
  end
end
