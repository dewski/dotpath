# frozen_string_literal: true

require 'test_helper'

module Dotpath
  class WalkTest < Minitest::Test
    def test_hash_can_generate_paths_for_top_level_keys
      hash = {
        action: 'user.login',
      }
      expected_paths = [
        '.action',
      ]

      expected_paths hash, expected_paths
    end

    def test_hash_can_double_quote_path_with_dot
      hash = {
        'action.name' => 'user.login',
        'user.info' => {
          'user.name' => 'dewski',
          'username' => 'dewski',
          'nested.key' => [
            {
              'user.name' => 'dewski',
              'username' => 'dewski',
            },
          ],
        },
      }
      expected_paths = [
        '."action.name"',
        '."user.info"."user.name"',
        '."user.info".username',
        '."user.info"."nested.key"[0]."user.name"',
        '."user.info"."nested.key"[0].username',
      ]

      expected_paths hash, expected_paths
    end

    def test_hash_can_generate_paths_for_nested_keys
      hash = {
        action: 'user.login',
        user: {
          name: 'dewski',
        },
      }
      expected_paths = [
        '.action',
        '.user.name',
      ]

      expected_paths hash, expected_paths
    end

    def test_hash_can_generate_paths_for_arrays
      hash = {
        action: 'user.login',
        users: [
          {
            name: 'dewski',
          },
          {
            name: 'dewski',
          },
        ],
      }
      expected_paths = [
        '.action',
        '.users[0].name',
        '.users[1].name',
      ]

      expected_paths hash, expected_paths
    end

    def test_hash_can_generate_paths_for_mixed_hashes
      hash = {
        action: 'user.login',
        users: [
          {
            name: 'dewski',
          },
          'dewski',
          {
            name: 'dewski',
          },
        ],
      }
      expected_paths = [
        '.action',
        '.users[0].name',
        '.users[1]',
        '.users[2].name',
      ]

      expected_paths hash, expected_paths
    end

    def test_array_can_generate_paths_for_top_level_keys
      array = [
        {
          action: 'user.login',
        },
      ]
      expected_paths = [
        '.[0].action',
      ]

      expected_paths array, expected_paths
    end

    def test_array_can_generate_paths_for_nested_keys
      array = [
        {
          action: 'user.login',
          user: {
            name: 'dewski',
          },
        },
      ]
      expected_paths = [
        '.[0].action',
        '.[0].user.name',
      ]

      expected_paths array, expected_paths
    end

    def test_multidimensional_array
      array = [
        [
          {
            action: 'user.login',
            user: {
              name: 'dewski',
            },
          },
        ],
      ]
      expected_paths = [
        '.[0][0].action',
        '.[0][0].user.name',
      ]

      expected_paths array, expected_paths
    end

    private

    def expected_paths(obj, expected_paths = [])
      actual_paths = []
      Dotpath::Walk.walk(obj) do |path, _value|
        actual_paths << path
      end

      assert_equal expected_paths, actual_paths
    end
  end
end
