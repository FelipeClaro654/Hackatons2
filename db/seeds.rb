# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Tipo.create(nome: 'Inquietos', cor: 'primary')
Tipo.create(nome: 'Inovadores', cor: 'success')
Tipo.create(nome: 'Experientes', cor: 'warning')
Tipo.create(nome: 'Ágeis', cor: 'danger')
