# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

vs1=Date.new(2016, 12, 01)
vs2=Date.new(2016, 12, 01)
ve1=Date.new(2016, 12, 22)
ve2=Date.new(2016, 12, 22)

list = List.create(name: 'Lista 0')

SimpleTask.create(description: 'simpletask1', state: 'Pendient', priority: 'High', list: list)
SimpleTask.create(description: 'simpletask2', state: 'Done', priority: 'Low', list: list)

TemporalTask.create(description: 'temporaltask1', state: 'Pendient', priority: 'Medium', validation_start: vs1, validation_end: ve1, list: list)
TemporalTask.create(description: 'temporaltask2', state: 'Pendient', priority: 'Low', validation_start:vs2, validation_end: ve2, list: list)

LongTask.create(description: 'longtask1', state: 'In course', priority: 'High', percentage: '10', list: list)
LongTask.create(description: 'longtask2', state: 'Pendient', priority: 'Low', percentage: '90', list: list)