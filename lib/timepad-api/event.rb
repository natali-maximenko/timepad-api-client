require_relative 'client'

module TimepadApi
  class EventStatus
    PRIVATE = 'private'
    DRAFT = 'draft'
    LINK_ONLY = 'link_only'
    PUBLIC = 'public'
    ACTIVE_STATUSES = ['private', 'link_only', 'public']

    def self.active?(status)
      EventStatus::ACTIVE_STATUSES.include?(status)
    end
  end

  class Event
    def initialize(timepad_client)
      @client = timepad_client
    end

    # Get all events
    #
    # @param [Hash]
    # @return [Array]
    def list(attrs = {})
      response = @client.request 'events', attrs
    end

    # Get event by event_id
    #
    # @param [String] event_id
    # @return [Hash]
    def get(event_id)
      @client.request "events/#{event_id}"
    end
  end
end
