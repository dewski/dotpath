# frozen_string_literal: true

require 'test_helper'

module JSON
  module Path
    class MutateTest < Minitest::Test
      def test_hash
        hash = {
          action: 'user.login',
          users: [
            'hello',
            {
              name: 'dewski',
            },
          ],
        }
        actual_hash = JSON::Path::Mutate.mutate(hash) do |_path, _value|
          true
        end
        expected_hash = {
          action: true,
          users: [
            true,
            {
              name: true,
            },
          ],
        }

        assert_equal expected_hash, actual_hash
      end

      def test_array
        array = [
          {
            action: 'user.login',
            users: [
              'hello',
              {
                name: 'dewski',
              },
            ],
          },
        ]
        actual_array = JSON::Path::Mutate.mutate(array) do |_path, _value|
          true
        end
        expected_array = [
          {
            action: true,
            users: [
              true,
              {
                name: true,
              },
            ],
          },
        ]

        assert_equal expected_array, actual_array
      end
    end
  end
end
