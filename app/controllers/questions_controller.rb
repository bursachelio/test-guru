class QuestionsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :question_not_found

  before_action :find_test, except: [:new, :create]
  before_action :find_question, only: [:show, :edit, :update, :destroy]

  def index
    @questions = @test.questions
  end

  def show
  
  end

  def new
    @question = @test.questions.new
  end

  def create
    @question = @test.questions.build(question_params)
    if @question.save
      redirect_to test_questions_path(@test), notice: "Вопрос успешно создан"
    else
      render :new
    end
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = @test.questions.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def question_not_found
    redirect_to tests_path, alert: "Вопрос не найден"
  end
end
