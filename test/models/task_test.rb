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

require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
