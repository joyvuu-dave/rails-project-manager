# == Schema Information
#
# Table name: tasks
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  status      :string(255)
#  project_id  :integer
#  created_at  :datetime
#  updated_at  :datetime
#
# Indexes
#
#  index_tasks_on_project_id  (project_id)
#

class TasksController < ApplicationController
  before_action :set_task
  before_action :signed_in

  # DELETE /tasks/:id
  def destroy
    @task.destroy
    render nothing: true
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def signed_in
      unless current_user.present?
        render js: "alert('You must be signed in.')", status: :unauthorized
      end
    end
end
