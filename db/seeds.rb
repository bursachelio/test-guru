# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# Создание пользователей
users = User.create!([
  { name: 'Author', email: 'author@example.com', password: 'password', password_confirmation: 'password' },
  { name: 'User 1', email: 'user1@example.com', password: 'password', password_confirmation: 'password' }
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
  { body: 'Какой цвет у неба?', test: tests[0] },
  { body: 'Какой самый большой океан?', test: tests[0] },
  { body: 'Кто написал "Война и мир"?', test: tests[1] },
  { body: 'В каком году была основана компания Apple?', test: tests[1] }
])

# Создание ответов для вопросов
answers = Answer.create!([
  { body: 'Синий', correct: true, question: questions[0] },
  { body: 'Зеленый', correct: false, question: questions[0] },
  { body: 'Красный', correct: false, question: questions[0] },
  { body: 'Желтый', correct: false, question: questions[0] },
  { body: 'Тихий', correct: true, question: questions[1] },
  { body: 'Атлантический', correct: false, question: questions[1] },
  { body: 'Индийский', correct: false, question: questions[1] },
  { body: 'Северный Ледовитый', correct: false, question: questions[1] },
  { body: 'Лев Толстой', correct: true, question: questions[2] },
  { body: 'Федор Достоевский', correct: false, question: questions[2] },
  { body: 'Антон Чехов', correct: false, question: questions[2] },
  { body: 'Николай Гоголь', correct: false, question: questions[2] },
  { body: '1976', correct: true, question: questions[3] },
  { body: '1980', correct: false, question: questions[3] },
  { body: '1990', correct: false, question: questions[3] },
  { body: '2000', correct: false, question: questions[3] }
])

# Создание результатов
results = Result.create!([
  { user: users[0], test: tests[0] },
  { user: users[1], test: tests[1] }
])

puts 'Успешно созданы начальные данные'
