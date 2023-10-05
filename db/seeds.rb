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
  { title: 'Beginer' }
])
# Создание тестов
tests = Test.create!([
  { title: 'Test 1', level: 1, category_id: categories[0].id, author_id: users[0].id },
  { title: 'Test 2', level: 2, category_id: categories[1].id, author_id: users[1].id }
])

# Создание вопросов для тестов
questions = Question.create!([
  { body: 'Question 1 for Test 1', test_id: tests[0].id },
  { body: 'Question 2 for Test 1', test_id: tests[0].id },
  { body: 'Question 1 for Test 2', test_id: tests[1].id },
  { body: 'Question 2 for Test 2', test_id: tests[1].id }
])

# Создание ответов для вопросов
Answer.create!([
  { body: 'Answer 1 for Question 1', correct: true, question_id: questions[0].id },
  { body: 'Answer 2 for Question 1', correct: false, question_id: questions[0].id },
  { body: 'Answer 3 for Question 1', correct: false, question_id: questions[0].id },
  { body: 'Answer 4 for Question 1', correct: false, question_id: questions[0].id },
  { body: 'Answer 1 for Question 2', correct: false, question_id: questions[1].id },
  { body: 'Answer 2 for Question 2', correct: true, question_id: questions[1].id },
  { body: 'Answer 3 for Question 2', correct: false, question_id: questions[1].id },
  { body: 'Answer 4 for Question 2', correct: false, question_id: questions[1].id },
  { body: 'Answer 1 for Question 3', correct: false, question_id: questions[2].id },
  { body: 'Answer 2 for Question 3', correct: false, question_id: questions[2].id },
  { body: 'Answer 3 for Question 3', correct: true, question_id: questions[2].id },
  { body: 'Answer 4 for Question 3', correct: false, question_id: questions[2].id },
  { body: 'Answer 1 for Question 4', correct: false, question_id: questions[3].id },
  { body: 'Answer 2 for Question 4', correct: false, question_id: questions[3].id },
  { body: 'Answer 3 for Question 4', correct: false, question_id: questions[3].id },
  { body: 'Answer 4 for Question 4', correct: true, question_id: questions[3].id }
])

Result.create!([
  { user_id: users[0].id, test_id: tests[0].id },
  { user_id: users[1].id, test_id: tests[1].id }
])


puts 'Успешно созданы начальные данные'
