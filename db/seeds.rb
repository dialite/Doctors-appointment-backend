# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(name: "Dr. Victor Wiel", email: 'codinggroup@gmail.com', password: 'password', password_confirmation: 'password', role: 'admin')

Doctor.create(name: "Dr. Ruthie", lastname: "Brendan" speciality: 'Surgeon ', 
    image: ActionController::Base.helpers.image_url('dr_andrew_bile.png'), gender: 'Female')
Doctor.create(name: "Dr. Anne Zawadi", speciality: 'Dentist', 
    image: ActionController::Base.helpers.image_url('dr_anne_zawadi.png'), gender: 'Female')
Doctor.create(name: "Dr. Mark Xaverian", speciality: 'Oncologist', 
    image: ActionController::Base.helpers.image_url('dr_mark_x.png'), gender: 'Male')
Doctor.create(name: "Dr. Rawal Parag", speciality: 'Cardiologist', 
    image: ActionController::Base.helpers.image_url('dr_rawal_parag.png'), gender: 'Male')
