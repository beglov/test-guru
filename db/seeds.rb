# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = Admin.create!(email: 'beglov.sergey@yandex.ru', password: '1q2w3e4r', first_name: 'Sergey', last_name: 'Beglov')
categories = Category.create!([{title: 'Frontend'}, {title: 'Backend'}, {title: 'DevOps'}])
tests = admin.tests.create!([
  {title: 'HTML', level: 0, category_id: categories[0].id, author_id: admin.id},
  {title: 'Go', level: 1, category_id: categories[1].id, author_id: admin.id},
  {title: 'Ruby', level: 1, category_id: categories[1].id, author_id: admin.id},
  {title: 'Docker', level: 2, category_id: categories[2].id, author_id: admin.id}
])
questions = Question.create!([
  {body: 'Укажите тег ссылки', test_id: tests[0].id},
  {body: 'Укажите тег параграфа', test_id: tests[0].id},
  {body: 'Ruby интерпретируемый язык или компилируемый?', test_id: tests[2].id},
  {body: 'Самый популярный фреймворк на руби', test_id: tests[2].id}
])
Answer.create!([
  {body: '<z>', question_id: questions[0].id},
  {body: '<t>', question_id: questions[0].id},
  {body: '<pre>', question_id: questions[0].id},
  {body: '<a>', question_id: questions[0].id, correct: true},
  {body: '<p>', question_id: questions[1].id, correct: true},
  {body: '<g>', question_id: questions[1].id},
  {body: '<input>', question_id: questions[1].id},
  {body: '<i>', question_id: questions[1].id},
  {body: 'интерпретируемый', question_id: questions[2].id, correct: true},
  {body: 'компилируемый', question_id: questions[2].id},
  {body: 'Rails', question_id: questions[3].id, correct: true},
  {body: 'Laravel', question_id: questions[3].id},
  {body: 'Sinatra', question_id: questions[3].id}
])
