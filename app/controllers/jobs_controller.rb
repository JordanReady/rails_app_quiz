class JobsController < ApplicationController
    def index 
        @jobs = Job.all 
    end

    def create
        @job = Job.create(url: params[:url],
        employer_name: params[:employer_name],
        employer_description: params[:employer_descriptio],job_title: params[:job_title],
        job_description: params[:job_description],
        year_of_experience: params[:year_of_experience],
        education_requirement: params[:education_requirement],
        industry: params[:industry],
        base_salary: params[:base_salary],
        employment_type_id: params[:employment_type_id])

        if @job.save
            render json: @job, status: :created
        else
            render json: @job.errors, status: :unproccessable_entity
        end
    end

    def show
        @job = Job.find_by(id: params[:id])
        if @job
            render 'jobs/show'
        else 
            render json: {error: 'Job Not Found.'}
        end
    end
end
