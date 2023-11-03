class QuestionsController < ApplicationController
  before_action :find_test, only: [:new, :create]
  before_action :find_question, only: [:show, :edit, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :question_not_found

  def index
    @questions = Question.all
    render plain: @questions.map { |question| question.body }.join("\n")
  end  

  def show
    render plain: @question.body, status: :ok
  end

  def new
    @question = Question.new
  end

  def create
    @question = @test.questions.build(question_params)
    if @question.save
      redirect_to question_path(@question), notice: 'Вопрос успешно создан'
    else
      render 'new'
    end
  end

  def destroy
    @question.destroy
    redirect_to questions_path, notice: 'Вопрос успешно удален'
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_not_found
    render plain: 'Вопрос не найден', status: :not_found
  end

  def question_params
    params.require(:question).permit(:body)
  end
end
