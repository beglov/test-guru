# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create
categories = Category.create!([{title: 'Frontend'}, {title: 'Backend'}, {title: 'DevOps'}])
tests = Test.create!([
  {title: 'HTML', level: 0, category_id: categories[0].id},
  {title: 'Go', level: 1, category_id: categories[1].id},
  {title: 'Ruby', level: 1, category_id: categories[1].id},
  {title: 'Docker', level: 2, category_id: categories[2].id}
])
user.tests = tests
questions = Question.create!([
  {body: 'Тег ссылки', test_id: tests[0].id},
  {body: 'Тег параграфа', test_id: tests[0].id},
  {body: 'Ruby интерпретируемый язык или компилируемый?', test_id: tests[2].id},
  {body: 'Самый популярный фреймворк на руби', test_id: tests[2].id}
])
Answer.create!([
  {body: '<a>', question_id: questions[0].id},
  {body: '<p>', question_id: questions[1].id},
  {body: 'интерпретируемый', question_id: questions[2].id},
  {body: 'Rails', question_id: questions[3].id}
])
