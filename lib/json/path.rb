# frozen_string_literal: true

require 'json/path/version'

module JSON
  module Path
    DELIMITER = '.'

    autoload :Walk, 'json_path/walk'
    autoload :Mutate, 'json_path/mutate'
    autoload :Extension, 'json_path/extension'

    def self.encode(key)
      key = key.to_s
      key.include?(DELIMITER) ? "\"#{key}\"" : key
    end

    # Retrieve a value at a given JSON path for an Array or Hash.
    #
    # @param object [Hash, Array] The object that can be navigated using JSON path.
    # @param json_path [String] The JSON path for the requested value.
    #
    # @return the value at JSON path.
    def self.value_at_path(object, json_path)
      raise ArgumentError, "#{object.class} does not support JSON path" unless object.respond_to?(:each_with_json_path)

      val = nil
      object.each_with_json_path do |path, value|
        if json_path == path
          val = value
          break
        end
      end
      val
    end
  end
end

Hash.prepend(JSONPath::Extension)
Array.prepend(JSONPath::Extension)
