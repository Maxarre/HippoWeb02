class PatientsController < ApplicationController
  def index
    @selected_patient = params[:patient]
    if params[:patient]
      @patient = Patient.where(id: params[:patient].to_i)
    else
      @patient = Patient.all
    end
    @consultations = Consultation.all
  end

  def show
    @patient = Patient.find(params[:id])
    @consultations = @patient.consultations
    respond_to do |format|
      format.html # show.html.erb
      format.js # show.js.erb
    end
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    @patient.user = current_user
    if @patient.save
      redirect_to medicalrecord_path
    else
      render :new
    end
  end

  def edit
    @patient = Patient.find(params[:id])
  end

  def update
    @patient = Patient.find(params[:id])
    @patient.update(params[:patient])
    redirect_to dashboard_path
  end

  def destroy
    @patient = Patient.find(params[:id])
    @patient.destroy

    redirect_to dashboard_path
  end

  private

  def patient_params
    params.require(:patient).permit(:gender, :email, :first_name, :last_name, :phone, :job_title, :address, :city, :zipcode, :date_of_birth)
  end
end
