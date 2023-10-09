class User < ApplicationRecord
  def tests_at_difficulty_level(level)
    Test.joins('INNER JOIN results ON results.test_id = tests.id')
        .where(results: { user_id: id }, level: level)
  end
end
