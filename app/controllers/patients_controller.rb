# frozen_string_literal: true

class PatientsController < ApplicationController
  before_action :set_patient, only: %i[show edit update destroy]

  def index
    @patients = Patient.all
  end

  def show; end

  def new
    @patient = Patient.new
  end

  def edit; end

  def create
    @patient = Patient.new(patient_params)

    respond_to do |format|
      if @patient.save
        format.html { redirect_to @patient, notice: 'Patient was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @patient.update(patient_params)
        format.html { redirect_to @patient, notice: 'Patient was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @patient.destroy!

    respond_to do |format|
      format.html { redirect_to patients_path, status: :see_other, notice: 'Patient was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_patient
    @patient = Patient.find(params[:id])
  end

  def patient_params
    params.require(:patient).permit(
      :avatar_url, :first_name, :last_name, :bio, :birdth_day, :sex, :marital_status,
      { address: %i[street city state country] },
      :status, :user_id
    )
  end
end
