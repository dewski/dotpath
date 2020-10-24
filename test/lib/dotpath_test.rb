# frozen_string_literal: true

require 'test_helper'

class DotpathTest < Minitest::Test
  def test_hash_retrieve_top_level_value_at_path
    hash = {
      action: 'user.login',
    }

    assert_equal 'user.login', Dotpath.value_at_path(hash, '.action')
  end

  def test_hash_retrieve_nested_value_at_path
    hash = {
      action: 'user.login',
      user: {
        name: 'dewski',
      },
    }

    assert_equal 'dewski', Dotpath.value_at_path(hash, '.user.name')
  end

  def test_hash_retrieve_nested_value_in_array_at_path
    hash = {
      action: 'user.login',
      users: [
        {
          name: 'dewski',
        },
      ],
    }

    assert_equal 'dewski', Dotpath.value_at_path(hash, '.users[0].name')
  end

  def test_hash_returns_nil_if_path_missing
    assert_nil Dotpath.value_at_path({}, '.users[0].name')
  end

  def test_array_retrieve_top_level_value_at_path
    array = [
      {
        action: 'user.login',
      },
    ]

    assert_equal 'user.login', Dotpath.value_at_path(array, '.[0].action')
  end

  def test_array_retrieve_nested_value_at_path
    array = [
      {
        action: 'user.login',
        user: {
          name: 'dewski',
        },
      },
    ]

    assert_equal 'dewski', Dotpath.value_at_path(array, '.[0].user.name')
  end

  def test_array_retrieve_nested_value_in_array_at_path
    array = [
      {
        action: 'user.login',
        users: [
          {
            name: 'dewski',
          },
        ],
      },
    ]

    assert_equal 'dewski', Dotpath.value_at_path(array, '.[0].users[0].name')
  end

  def test_array_returns_nil_if_path_missing
    assert_nil Dotpath.value_at_path([], '.users[0].name')
  end
end
