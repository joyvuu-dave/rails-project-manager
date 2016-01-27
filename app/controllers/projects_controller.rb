# == Schema Information
#
# Table name: projects
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy, :tasks]
  before_action :signed_in, only: [:create, :update, :destroy]
  before_action :confirm_user, only: [:update, :destroy]


  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.page(params[:page]).per(10)
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  # GET /projects/:id/tasks
  def tasks
    @tasks = @project.tasks

    respond_to do |format|
      format.js { render 'tasks.js.erb' }
    end
  end

  # GET /projects/new
  def new
    @project = Project.new
    @project.tasks.build
  end

  # GET /projects/1/edit
  def edit
    @project.tasks.build
  end

  # POST /projects
  # POST /projects.json
  def create
    project_params[:project_users_attributes][:user_id] = current_user.id
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render action: 'show', status: :created, location: @project }
      else
        format.html { render action: 'new' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    respond_to do |format|
      if @project.destroy
        format.html { redirect_to projects_url }
        format.json { head :no_content }
      else
        format.html { redirect_to projects_url, notice: 'Cannot delete project with started or finished tasks.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    def signed_in
      unless current_user.present?
        respond_to do |format|
          format.html { redirect_to projects_url, notice: 'You must be signed in.' }
          format.json { head :no_content }
        end
      end
    end

    def confirm_user

      unless ProjectUser.exists?(user_id: current_user.id, project_id: @project.id)
        respond_to do |format|
          format.html { redirect_to projects_url, notice: 'You are not associated with this project.' }
          format.json { head :no_content }
        end
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, tasks_attributes: [:id, :name, :description, :status, :project_id], project_users_attributes: [:id, :user_id, :project_id])
    end
end
