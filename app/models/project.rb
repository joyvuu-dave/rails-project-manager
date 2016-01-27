# == Schema Information
#
# Table name: projects
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Project < ActiveRecord::Base
  has_many :project_users, dependent: :destroy
  has_many :users, through: :project_users
  has_many :tasks, dependent: :destroy

  accepts_nested_attributes_for :tasks, reject_if: proc { |attributes| attributes['name'].blank? }
  accepts_nested_attributes_for :project_users

  before_destroy :check_for_open_tasks

  def self.cleanup
    Project.find_each do |project|
      next if Time.now - project.updated_at < 1.week
      project.tasks.where(status: 'finished').delete_all
    end
  end

  private

    def check_for_open_tasks
      false if tasks.pluck(:status).any? { |status| status == 'started' || status == 'finished' }
    end
end
