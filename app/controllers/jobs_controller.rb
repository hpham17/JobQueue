class JobsController < ApplicationController
  def index
    @jobs = Job.all
    @job = Job.new
  end

  def show
    @job = Job.find params[:id]
  end

  def create
    @job = Job.new(job_params)

    respond_to do |format|
      if @job.save
        format.html { redirect_to @job, notice: 'Job was successfully created.' }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def job_params
    params.require(:job).permit(:url)
  end
end
