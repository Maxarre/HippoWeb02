# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "faker"

User.create(email: 'henry@martin.com', password: '424242', first_name: 'Henry', last_name: 'Martin', phone: '0697042328', office_address: '0 rue Crespin du Gast', office_info: 'Code: 4210', photo: "https://upload.wikimedia.org/wikipedia/en/thumb/8/87/Cox-season9.jpg/250px-Cox-season9.jpg")



# Patient.create(first_name: 'Jane', last_name: 'Doe', phone: '6050990840',
#   job_title: 'Dead', address: '1 rue Crespin du Gast', city: 'Paris',
#   zipcode: '75011', date_of_birth: '26/09/1987', gender: 'female', email: 'jane.doe@gmail.com',
#   user_id: 1)

fn_array = ['Gabriel', 'Emma', 'Louis', 'Raphaël', 'Jules', 'Adam', 'Lucas', 'Léo', 'Louise', 'Jade', 'Hugo', 'Arthur', 'Nathan', 'Alice', 'Liam', 'Ethan', 'Paul', 'Chloé', 'Lina', 'Mila', 'Tom', 'Léa', 'Manon', 'Sacha', 'Noah', 'Gabin', 'Nolan', 'Enzo', 'Mohamed', 'Rose', 'Anna', 'Inès', 'Aaron', 'Camille', 'Lola', 'Timéo', 'Théo', 'Ambre', 'Léna', 'Zoé', 'Mathis', 'Juliette', 'Axel', 'Julia', 'Victor', 'Lou', 'Antoine', 'Valentin', 'Sarah', 'Lucie']
ln_array = ['Martin', 'Legrand', 'Bernard', 'Garnier', 'Dubois', 'Faure', 'Thomas', 'Rousseau', 'Robert', 'Blanc', 'Richard', 'Guerin', 'Petit', 'Muller', 'Durand', 'Henry', 'Leroy', 'Roussel', 'Moreau', 'Nicolas', 'Simon', 'Perrin', 'Laurent', 'Morin', 'Lefebvre', 'Mathieu', 'Michel', 'Clement', 'Garcia', 'Gauthier', 'David', 'Dumont', 'Bertrand', 'Lopez', 'Roux', 'Fontaine', 'Vincent', 'Chevalier', 'Fournier', 'Robin', 'Morel', 'Masson', 'Girard', 'Sanchez', 'Andre', 'Gerard', 'Lefevre', 'Nguyen', 'Mercier', 'Boyer', 'Dupont', 'Denis', 'Lambert', 'Lemaire', 'Bonnet', 'Duval', 'Francois', 'Joly', 'Martinez', 'Gautier']
160.times do
  # @fname = :first_name
  patient = Patient.new(
    first_name: fn_array.sample,
    last_name: ln_array.sample,
    phone: Faker::PhoneNumber.phone_number,
    job_title: Faker::Job.title,
    address: Faker::Address.street_address,
    city: Faker::Address.city,
    zipcode: Faker::Address.zip_code,
    date_of_birth: Faker::Date.birthday(18, 65),
    gender: Faker::Gender.binary_type,
    email: Faker::Internet.free_email,
    user_id: 1
  )
  patient.save!
end

# Consultation.create(patient_id: 1, start_time: '14h30',
#   end_time: '15h30', consultation_type: 'Operation')
time_array = [8..20]
type_array = ["First meeting", "Operation", "Consultation"]
status_array = ["Upcoming", "Past"]
i = 1
53.times do
  consultation = Consultation.new(
    patient_id: i,
    status: status_array.sample,
    start_time: Faker::Time.forward(30, :morning),
    end_time: Faker::Time.forward(30, :morning),
    consultation_type: type_array.sample,
    required_documents: Faker::Lorem.paragraph_by_chars,
    patient_complain: Faker::Lorem.paragraph_by_chars,
    diagnostic: Faker::Lorem.paragraph_by_chars,
    care_plan: Faker::Lorem.paragraph_by_chars,
    prescription: Faker::Lorem.paragraph_by_chars,
    patient_note_attachment: Faker::Books::Dune.quote
    )
    i += 1
  consultation.save!
end


i = 54
53.times do
  consultation = Consultation.new(
    patient_id: i,
    status: status_array.sample,
    start_time: Faker::Time.forward(30, :afternoon),
    end_time: Faker::Time.forward(30, :afternoon),
    consultation_type: type_array.sample,
    required_documents: Faker::Lorem.paragraph_by_chars,
    patient_complain: Faker::Lorem.paragraph_by_chars,
    diagnostic: Faker::Lorem.paragraph_by_chars,
    care_plan: Faker::Lorem.paragraph_by_chars,
    prescription: Faker::Lorem.paragraph_by_chars,
    note_patient: Faker::Lorem.paragraph_by_chars,
    patient_note_attachment: Faker::Books::Dune.quote
    )
    i += 1
  consultation.save!
end

i = 108
53.times do
  consultation = Consultation.new(
    patient_id: i,
    status: status_array.sample,
    start_time: Faker::Time.forward(30, :evening),
    end_time: Faker::Time.forward(30, :evening),
    consultation_type: type_array.sample,
    required_documents: Faker::Lorem.paragraph_by_chars,
    patient_complain: Faker::Lorem.paragraph_by_chars,
    diagnostic: Faker::Lorem.paragraph_by_chars,
    care_plan: Faker::Lorem.paragraph_by_chars,
    prescription: Faker::Lorem.paragraph_by_chars,
    note_patient: Faker::Lorem.paragraph_by_chars,
    patient_note_attachment: Faker::Books::Dune.quote,
    )
    i += 1
  consultation.save!
end

a = Patient.new(user_id: 1, first_name: 'Raphaël', last_name: 'Lenfant', phone: '06 67 76 97 19', job_title: 'Public servent', address: '76 rue de moscou', city: 'Paris', zipcode: '75008', date_of_birth: '04/06/1980', gender: 'Male', email: 'henry.martin@gmail.com')
a.save!
b = Consultation.new(patient_id: a.id, status: 'Past', start_time: '06/09/2018 08:30PM', end_time: '06/09/2018 09:00PM', consultation_type: "First meeting", patient_complain: "J'en ai assez de ne pas pouvoir m'endormir, je n'en peux plus. En ce moment, je me couche vers 0h00 ou 1 heure du matin, et je n'arrive à m'endormir qu'a 6 heures du matin!!!! Pendant tout ce temps, je reste allongée à ne rien faire, et à me prendre la tête avec pleins de trucs qui me stressent. Mais ce qui est bisard c'est que je ne suis jamais fatiguée, je ne ressens jamais l'envie de dormir", diagnostic: "Le manque répété de sommeil peut avoir des conséquences néfastes à court et à long terme.", care_plan: " Laisser passer un peu de temps : si l'insomnie s'aggrave ou ne s'améliore pas après une première prise en charge, s'il suspecte un syndrome d'apnées obstructives du sommeil ou un syndrome des jambes sans repos", prescription: "Un enregistrement du sommeil peut être réalisé dans un centre spécialisé ou à domicile. Les appareils utilisés enregistrent l'activité électrique du cerveau, les mouvements des yeux, le tonus musculaire du menton et l'activité cardiaque, grâce à des électrodes placées à différents endroits du corps. L'examen est indolore. Relaxation techniques", note_patient: '')
b.save!
c = Consultation.new(patient_id: a.id, status: 'Past', start_time: '18/02/2019 08:30PM', end_time: '18/02/2019 09:00PM', consultation_type: "Consultation", patient_complain:"J'ai pris de la mélatonine associée à du magnésium sur les conseils pour bien mieux dormir donnés par mon pharmacien mais ca ne marche pas.", diagnostic: 'Avant de prescrire des médicaments plus lourds il est nécessaire de mettre le patient en observation.', care_plan: 'Mise en relation avec Dr. Cox du centre de sommeil de la ville', prescription: "", note_patient: 'Demander Dr. Cox')
c.save!
d = Consultation.new(patient_id: a.id, status: 'Upcoming', start_time: '18/07/2019 09:00AM', end_time: '18/07/2019 09:30AM', consultation_type: "Consultation")
d.save!
e = Email.new(consultation_id: b.id, title: 'Information suite à notre rencontre', content: b.prescription)
e.save!
f = Email.new(consultation_id: c.id, title: 'Retour sur notre consultation', content: c.prescription)
f.save!
g = Email.new(consultation_id: d.id, title: 'Votre rdv avec le centre du sommeil', content: d.prescription)
g.save!

Consultation.all.each do |c|
  if c.start_time.day == 04 || c.start_time.day == 11 || c.start_time.day == 21 || c.start_time.day == 28
    c.destroy
  end
end

# 10.times do
#   consultation = Consultation.new(
#     patient_id: i,
#     status: status_array.sample,
#     start_time: Faker::Time.forward(5, :morning),
#     end_time: Faker::Time.forward(5, :evening),
#     consultation_type: type_array.sample,
#     required_documents: Faker::Lorem.paragraph_by_chars,
#     patient_complain: Faker::Lorem.paragraph_by_chars,
#     diagnostic: Faker::Lorem.paragraph_by_chars,
#     care_plan: Faker::Lorem.paragraph_by_chars,
#     prescription: Faker::Lorem.paragraph_by_chars,
#     note_patient: Faker::Lorem.paragraph_by_chars,
#     patient_note_attachment: Faker::Books::Dune.quote,
#     )
#     i += 1
#   consultation.save!
# end
