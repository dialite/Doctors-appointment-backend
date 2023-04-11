# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(username: "Dr. Victor Wiel")

Doctor.create(name: "Dr. Ruthie", lastname: "Brendan", speciality: 'Surgeon ', 
    image: ActionController::Base.helpers.image_url('jay_yuno.jpg'), experience: 3, consultation: 20)
Doctor.create(name: "Dr. Stray", lastname: "Clifford", speciality: 'Dentist', 
    image: ActionController::Base.helpers.image_url('jay_yuno.jpg'), experience: 5, consultation: 50)
