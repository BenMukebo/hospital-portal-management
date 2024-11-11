# frozen_string_literal: true

class Patient < ApplicationRecord
  belongs_to :user, optional: true

  enum status: { active: 0, inactive: 1 }, _default: :active
  enum marital_status: { single: 0, married: 1, midowed: 2, divorced: 3, separated: 4 }.freeze

  validates :avatar_url, format: { with: URI::DEFAULT_PARSER.make_regexp }, allow_blank: true
  validates :first_name, :last_name, presence: true, length: { minimum: 1, maximum: 24 }
  validates :bio, presence: true, length: { maximum: 255 }
  validates :phone, uniqueness: true, length: { within: 10..14 }
  validates :status, presence: true, inclusion: { in: statuses.keys }
  validates :marital_status, presence: true, inclusion: { in: marital_statuses.keys }

  def self.group_by_age_range(range = 10)
    # Adjust logic to suit age grouping based on birth dates
    # all.group_by { |p| ((Date.today.year - p.birdth_day.year) / range) * range }
    all.group_by { |p| ((Date.today.year - (p.birdth_day || Date.today).year) / range) * range }
       .transform_keys { |k| "#{k}-#{k + range - 1} years" }
       .transform_values(&:count)
  end
end
