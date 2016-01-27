desc "Delete finished tasks on projects that haven't been updated in a week or more"
task remove_finished_tasks: :environment do
  puts "Cleaning up finished tasks..."
  Project.cleanup
  puts "done."
end
