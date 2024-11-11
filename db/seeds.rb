# frozen_string_literal: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
if Rails.env.development?
  User.create!(
    email: 'admin@gamil.com',
    password: 'password',
    password_confirmation: 'password',
    role: 'admin'
  )
  User.create!(
    email: 'doctor@gmail.com',
    password: 'password',
    password_confirmation: 'password',
    role: 'doctor'
  )

  User.create!(
    email: 'receptionist@gmail.com',
    password: 'password',
    password_confirmation: 'password',
    role: 'receptionist'
  )
end
