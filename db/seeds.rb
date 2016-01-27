# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


user1 = User.create(fname: 'Barack', lname: 'Obama', email: 'potus@whitehouse.gov', password: 'potus1', role: 100)
user2 = User.create(fname: 'Bo', email: 'bo@whitehouse.gov', password: 'thedog')

project = Project.create(name: 'Treehouse')

ProjectUser.create(user_id: user1.id, project_id: project.id)
ProjectUser.create(user_id: user2.id, project_id: project.id)

Task.create(name: 'Find Tree', description: 'search the ground for a big tree', status: 'finished', project_id: project.id)
Task.create(name: 'Build', description: 'build the actual tree house', status: 'started', project_id: project.id)
Task.create(name: 'Party', description: 'have a opening gala at the tree house', status: 'unstarted', project_id: project.id)

