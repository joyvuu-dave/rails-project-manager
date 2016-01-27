# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


user1 = User.create(fname: 'Admin', email: 'admin@email.com', password: 'password1', role: 100)
user2 = User.create(fname: 'User', email: 'user@email.com', password: 'password1')

project1 = Project.create(name: "Admin's Project")
project2 = Project.create(name: "User's Project")
project3 = Project.create(name: 'Shared Project')

ProjectUser.create(user_id: user1.id, project_id: project1.id)
ProjectUser.create(user_id: user2.id, project_id: project2.id)
ProjectUser.create(user_id: user1.id, project_id: project3.id)
ProjectUser.create(user_id: user2.id, project_id: project3.id)

Task.create(name: 'Admin task 1', description: 'aaa', status: 'unstarted', project_id: project1.id)
Task.create(name: 'Admin task 2', description: 'bbb', status: 'started', project_id: project1.id)
Task.create(name: 'Admin task 3', description: 'ccc', status: 'finished', project_id: project1.id)

Task.create(name: 'User task 1', description: 'aaa', status: 'unstarted', project_id: project2.id)
Task.create(name: 'User task 2', description: 'bbb', status: 'started', project_id: project2.id)
Task.create(name: 'User task 3', description: 'ccc', status: 'finished', project_id: project2.id)

Task.create(name: 'Shared task 1', description: 'aaa', status: 'unstarted', project_id: project3.id)
Task.create(name: 'Shared task 2', description: 'bbb', status: 'started', project_id: project3.id)
Task.create(name: 'Shared task 3', description: 'ccc', status: 'finished', project_id: project3.id)
