# frozen_string_literal: true

module JSON
  module Path
    module Extension
      def each_with_json_path(&block)
        JSON::Path::Walk.walk(self, &block)
      end

      def collect_with_json_path(&block)
        JSON::Path::Mutate.mutate(self, &block)
      end

      def value_at_path(json_path)
        JSON::Path.value_at_path(self, json_path)
      end
    end
  end
end
