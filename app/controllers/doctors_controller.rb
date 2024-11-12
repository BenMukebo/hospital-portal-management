# frozen_string_literal: true

class DoctorsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_doctor

  def patient_statistics
    @patient_registration_data = Patient.group_by_day(:created_at).count
    @patient_by_gender = Patient.group(:sex).count
    @patient_by_age_group = Patient.group_by_age_range(10).count # Custom method to bucket ages in 10-year ranges
    @patient_by_month = Patient.group_by_month(:created_at).count
  end

  private

  def authorize_doctor
    redirect_to root_path, alert: 'Access Denied' unless current_user.doctor?
  end
end
