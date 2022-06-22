require 'rails_helper'

RSpec.describe JobsController, type: :controller do
    render_views

    describe 'POST /jobs' do
        it 'create a new job object' do
            post :create, params: { url: 'john.com',
                employer_name: 'John', 
                employer_descriptio: 'description of John',
                job_title: 'Johns assistant',
                job_description: 'assist johns every need',
                year_of_experience: 0,
                education_requirement: 'phd',
                industry: 'assistant industry',
                base_salary: '$100',
                employment_type_id: 1
             }

            expect(Job.count).to eq(1)
        end

        it 'responds with a job object' do
            post :create, params: {employer_name: 'Joe'}

            expected_response = {
                job: {
                    employer_name: 'Joe'
                }
            }

            expect(response.body).to eq(expected_response.to_json)
        end
    end
end
