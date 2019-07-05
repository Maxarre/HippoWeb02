class EmailsController < ApplicationController
  def index
    @emails = Email.all
  end

  def show
    @patient = Patient.find(params[:patient_id])
    @emails = Email.all
    respond_to do |format|
      format.html { redirect_to patient_email_path(@patient) } # show.html.erb
      format.js # show.js.erb
    end
  end

  def new
    @consultation = Consultation.find(params[:consultation_id])
    @email = Email.new
    @patient = @consultation.patient
    @email.consultation_id = @consultation.id
    @content = "M. #{@consultation.patient.last_name},\n\nVoici un récapitulatif de notre consultation du #{@consultation.start_time.strftime('%m/%d/%Y')}.\n\n\n Vos remarques:\n#{@consultation.patient_complain}\n\nLe diagnostic:\n#{@consultation.diagnostic}\n\nLe plan médical:\n#{@consultation.care_plan}\n\nPrescrptions:\n#{@consultation.prescription}\n\n\nBien cordialement,\n\nDr.Martin"
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @consultation = Consultation.find(params[:consultation_id])
    @email = Email.new(email_params)
    @email.consultation = @consultation
    if @email.save
      redirect_to patient_path(@consultation.patient)
    else
      render :new
    end
  end

  private

  def email_params
    params.require(:email).permit(:consultation_id, :title, :content, :subject)
  end
end
