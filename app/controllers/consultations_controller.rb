class ConsultationsController < ApplicationController
  def index
    @consultations = Consultation.all
    @consultation = Consultation.new(params[:consultation])
  end

  def show
    @consultation = Consultation.find(params[:id])
  end

  def new
    @consultation = Consultation.new
  end

  def create
    @consultation = Consultation.new(consultation_params)
    year = params[:consultation][:start_time].to_date.year
    month = params[:consultation][:start_time].to_date.month
    day = params[:consultation][:start_time].to_date.day
    hour = params[:consultation][:hour].to_i if !params[:consultation][:hour].nil?
    hour = params[:hour].to_i if !params[:hour].nil?
    start_time = DateTime.new(year, month, day, hour, 0, 0)
    @consultation.start_time = start_time
    @consultation.save
    redirect_to dashboard_path
  end

  def edit
    @patient = Patient.find(params[:patient_id])
    @consultation = @patient.consultations.last
    @consultation_templates = YAML.load_file("db/consultation_templates.yml")
    @consultation.patient = Patient.find(params[:patient_id])
    @all_tagg_list = ActsAsTaggableOn::Tag.all
    respond_to do |format|
      format.html { redirect_to edit_patient_consultation_path(@patient) }
      format.js
    end
  end

  def update
    @consultation = Consultation.find(params[:id])
    @consultation.patient = Patient.find(params[:patient_id])
    @consultation.save
    @consultation.update(consultation_params)
    redirect_to new_consultation_email_path(params[:id])
  end

  def add_tags
    @consultation = Consultation.find(params[:id])
    @patient = @consultation.patient
    @consultation.tag_list
    @i = 0
    @consultation_templates = YAML.load_file("db/consultation_templates.yml")
    params[:consultation][:tag_list].split(',').each do |t|
      @consultation.tag_list.add(t)
      @consultation.save
    end
    respond_to do |format|
      format.html { redirect_to edit_patient_consultation_path(params[:id]) }
      format.js
    end
  end

  def remove_tags
    @consultation = Consultation.find(params[:id])
    @consultation.tag_list.remove(params[:tag_name])
    @consultation.save
  end

  def destroy
  end

  private

  def consultation_params
    params.require(:consultation).permit(:patient_id, :status, :consultation_type, :required_documents, :patient_complain, :diagnostic, :care_plan, :prescription, :note_patient, :patient_note_attachment)
  end

end
