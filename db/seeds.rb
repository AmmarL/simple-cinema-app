# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
Room.destroy_all
Theater.destroy_all
UserType.destroy_all

   theater = Theater.create({ name: 'Kaledioskop' , description:'Kino Tuzla' , address:'Kazan Mahala 10' })
   rooms = Room.create([{ name: 'Sala 1' , description:'Mala Sala Kina Tuzla' , capacity: 100 , row: 10 , theater: theater },
   	{ name: 'Sala 2' , description:'Velika Sala Kina Tuzla' , capacity: 270 , row: 18 , theater: theater }])

   userTypes = UserType.create([{ name: 'Admin' , description:'Administrator' }, { name: 'Standard' , description:'Standardni korisnik' }])
   #Mayor.create(name: 'Emanuel', city: cities.first)
