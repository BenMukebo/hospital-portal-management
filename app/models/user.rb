# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable, :trackable,
         :recoverable, :rememberable, :validatable

  enum role: { patient: 0, receptionist: 1, doctor: 2, admin: 3 }, _prefix: false, _default: :patient, _suffix: true
end
