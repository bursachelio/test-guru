class QuestionsController < ApplicationController
  before_action :find_test
  before_action :find_question, only: [:show, :edit, :update, :destroy]

  def index
    @questions = @test.questions
    render plain: 'Это список вопросов теста'
  end

  def show
    render plain: 'Это конкретный вопрос'
  end

  def new
    @question = Question.new
  end

  def create
    @question = @test.questions.build(question_params)
    if @question.save
      redirect_to test_questions_path(@test), notice: 'Вопрос успешно создан'
    else
      render 'new'
    end
  end

  def destroy
    @question.destroy
    redirect_to test_questions_path(@test), notice: 'Вопрос успешно удален'
  end

  private

  def find_test
    @test = Test.find_by(params[:id])
  end

  def find_question
    @question = @test.questions.find_by(id: params[:id])
    render plain: 'Вопрос не найден', status: :not_found unless @question
  end

  def question_params
    params.require(:question).permit(:body)
  end
end
