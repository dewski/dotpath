# frozen_string_literal: true

module Dotpath
  class Mutate
    def self.mutate(obj, &block)
      case obj
      when Hash
        hash(obj, path: '', &block)
      when Array
        array(obj, &block)
      else
        obj
      end
    end

    def self.hash(obj, path: DELIMITER, &block)
      new_hash = {}
      obj.each do |key, value|
        new_path = [path, key].join(DELIMITER)
        case value
        when Hash
          new_hash[key] = hash(value, path: new_path, &block)
        when Array
          new_hash[key] = array(value, path: new_path, &block)
        else
          new_hash[key] = yield(new_path, value)
        end
      end
      new_hash
    end

    def self.array(obj, path: DELIMITER, &block)
      new_array = []
      index = 0
      obj.each do |value|
        new_path = "#{path}[#{index}]"
        case value
        when Hash
          new_array << hash(value, path: new_path, &block)
        when Array
          new_array << array(value, path: new_path, &block)
        else
          new_array << yield(new_path, value)
        end

        index += 1
      end
      new_array
    end
  end
end
