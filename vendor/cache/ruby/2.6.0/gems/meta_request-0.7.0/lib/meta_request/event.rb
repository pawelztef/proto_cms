require 'active_support'
require 'active_support/json'
require 'active_support/core_ext'

module MetaRequest

  # Subclass of ActiveSupport Event that is JSON encodable
  #
  class Event < ActiveSupport::Notifications::Event
    NOT_JSON_ENCODABLE = 'Not JSON Encodable'.freeze

    attr_reader :duration

    def initialize(name, start, ending, transaction_id, payload)
      super(name, start, ending, transaction_id, json_encodable(payload))
      @duration = 1000.0 * (ending - start)
    end

    def self.events_for_exception(exception_wrapper)
      if defined?(ActionDispatch::ExceptionWrapper)
        exception = exception_wrapper.exception
        trace = exception_wrapper.application_trace
        trace = exception_wrapper.framework_trace if trace.empty?
      else
        exception = exception_wrapper
        trace = exception.backtrace
      end
      trace.unshift "#{exception.class} (#{exception.message})"
      trace.map do |call|
        Event.new('process_action.action_controller.exception', 0, 0, nil, {:call => call})
      end
    end

    private

    def json_encodable(payload)
      return {} unless payload.is_a?(Hash)
      transform_hash(payload, :deep => true) { |hash, key, value|
        if value.class.to_s == 'ActionDispatch::Http::Headers'
          value = value.to_h.select { |k, _| k.upcase == k }
        elsif value.is_a?(ActiveRecord::ConnectionAdapters::AbstractAdapter)
          value = NOT_JSON_ENCODABLE
        end

        begin
          value.to_json(:methods => [:duration])
          new_value = value
        rescue
          new_value = NOT_JSON_ENCODABLE
        end
        hash[key] = new_value
      }.with_indifferent_access
    end

    # https://gist.github.com/dbenhur/1070399
    def transform_hash(original, options={}, &block)
      options[:safe_descent] ||= {}
      new_hash = {}
      options[:safe_descent][original.object_id] = new_hash
      original.inject(new_hash) { |result, (key,value)|
        if (options[:deep] && Hash === value)
          value = options[:safe_descent].fetch( value.object_id ) {
            transform_hash(value, options, &block)
          }
        end
        block.call(result,key,value)
        result
      }
    end

  end
end