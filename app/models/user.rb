# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable, :trackable,
         :recoverable, :rememberable, :validatable

  has_one :patient

  validates :email, length: { maximum: 128 },
                    uniqueness: { case_sensitive: false }, allow_blank: true,
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, presence: true, length: { minimum: 8 }, on: :create, allow_blank: false
  validates :password_confirmation, presence: true, allow_blank: true

  validates :terms_of_service, acceptance: true
  validates_inclusion_of :remember_me, in: [true, false], allow_blank: true

  enum role: { patient: 0, receptionist: 1, doctor: 2, admin: 3 }.freeze, _prefix: false, _default: :patient
end
