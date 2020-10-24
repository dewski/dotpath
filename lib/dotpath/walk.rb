# frozen_string_literal: true

module Dotpath
  class Walk
    def self.walk(obj, &block)
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
      obj.each do |key, value|
        new_path = [path, Dotpath.encode(key)].join(DELIMITER)
        case value
        when Hash
          hash(value, path: new_path, &block)
        when Array
          array(value, path: new_path, &block)
        else
          yield(new_path, value)
        end
      end
    end

    def self.array(obj, path: DELIMITER, &block)
      index = 0
      obj.each do |value|
        new_path = "#{path}[#{index}]"
        case value
        when Hash
          hash(value, path: new_path, &block)
        when Array
          array(value, path: new_path, &block)
        else
          yield(new_path, value)
        end

        index += 1
      end
    end
  end
end
