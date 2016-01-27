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
  has_many :project_users
  has_many :users, through: :project_users
  has_many :tasks, dependent: :destroy
  accepts_nested_attributes_for :tasks, reject_if: proc { |attributes| attributes['name'].blank? }

end
