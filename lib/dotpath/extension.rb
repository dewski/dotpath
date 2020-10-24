# frozen_string_literal: true

module Dotpath
  module Extension
    def each_with_json_path(&block)
      Dotpath::Walk.walk(self, &block)
    end

    def collect_with_json_path(&block)
      Dotpath::Mutate.mutate(self, &block)
    end

    def value_at_path(json_path)
      Dotpath.value_at_path(self, json_path)
    end
  end
end
