# frozen_string_literal: true

class DoctorsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_doctor

  def patient_statistics
    @patient_registration_data = Patient.group_by_day(:created_at).count
  end

  private

  def authorize_doctor
    redirect_to root_path, alert: 'Access Denied' unless current_user.doctor?
  end
end
