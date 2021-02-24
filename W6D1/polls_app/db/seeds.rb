# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([{ name: 'Mike Easter'}, { name: 'Donatello Nobody' }, {name: 'Kent Hoit'}])
polls = Poll.create([{title: 'What Day Is It', author_id: 1}, {title: 'What Is The Meaning Of Life', author_id: 1}])
questions = Question.create([{text: 'HUMP DAY', parent_poll_id: 1}, {text: 'WEDNESDAY MY DUDES', parent_poll_id: 1},
    {text: '42', parent_poll_id: 2}, {text: 'Blue', parent_poll_id: 2}])