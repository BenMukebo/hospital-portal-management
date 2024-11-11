# frozen_string_literal: true

class Patient < ApplicationRecord
  belongs_to :user, optional: true

  enum status: { active: 0, inactive: 1 }, _default: :active
  enum marital_status: { single: 0, married: 1, midowed: 2, divorced: 3, separated: 4 }.freeze

  validates :avatar_url, format: { with: URI::DEFAULT_PARSER.make_regexp }, allow_blank: true
  validates :first_name, :last_name, presence: true, length: { minimum: 1, maximum: 24 }
  validates :bio, presence: true, length: { maximum: 255 }
  validates :status, presence: true, inclusion: { in: statuses.keys }
  validates :marital_status, presence: true, inclusion: { in: marital_statuses.keys }
end
