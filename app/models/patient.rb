# frozen_string_literal: true

class Patient < ApplicationRecord
  belongs_to :user

  enum status: { active: 0, inactive: 1 }, _default: :active
  enum marital_status: { single: 0, married: 1, midowed: 2, divorced: 3, separated: 4 }.freeze
end
