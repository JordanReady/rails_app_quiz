class JobsController < ApplicationController
    def index 
        jobs = Job.all 
        render json: jobs
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

        render 'jobs/create.jbuilder'
    end

    def show
        @job = Job.find_by(id: params[:id])
        if @job
            render 'jobs/show.jbuilder'
        else 
            render json: {error: 'Job Not Found.'}
        end
    end
end
