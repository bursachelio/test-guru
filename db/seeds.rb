# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# Создание пользователей
users = User.create!([
  { name: 'Author', email: 'author@example.com' },
  { name: 'User 1', email: 'user1@example.com' }
])

# Создание категорий
categories = Category.create!([
  { title: 'Advanced' },
  { title: 'Beginner' }
])

# Создание тестов
tests = Test.create!([
  { title: 'Test 1', level: 1, category: categories[0], author: users[0] },
  { title: 'Test 2', level: 2, category: categories[1], author: users[1] }
])

# Создание вопросов для тестов
questions = Question.create!([
  { body: 'Question 1 for Test 1', test: tests[0] },
  { body: 'Question 2 for Test 1', test: tests[0] },
  { body: 'Question 1 for Test 2', test: tests[1] },
  { body: 'Question 2 for Test 2', test: tests[1] }
])

# Создание ответов для вопросов
answers = Answer.create!([
  { body: 'Answer 1 for Question 1', correct: true, question: questions[0] },
  { body: 'Answer 2 for Question 1', correct: false, question: questions[0] },
  { body: 'Answer 3 for Question 1', correct: false, question: questions[0] },
  { body: 'Answer 4 for Question 1', correct: false, question: questions[0] },
  { body: 'Answer 1 for Question 2', correct: false, question: questions[1] },
  { body: 'Answer 2 for Question 2', correct: true, question: questions[1] },
  { body: 'Answer 3 for Question 2', correct: false, question: questions[1] },
  { body: 'Answer 4 for Question 2', correct: false, question: questions[1] },
])

# Создание результатов
results = Result.create!([
  { user: users[0], test: tests[0] },
  { user: users[1], test: tests[1] }
])

puts 'Успешно созданы начальные данные'
