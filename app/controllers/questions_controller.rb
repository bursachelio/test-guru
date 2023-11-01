class QuestionsController < ApplicationController
  before_action :find_question, only: [:show, :edit, :update, :destroy]

  def index
    @questions = Question.all
    render plain: 'Это список вопросов'
  end

  def show
    render plain: 'Это конкретный вопрос'
  end

  def new
    @test = Test.find(params[:test_id])
    @question = Question.new
  end

  def create
    @test = Test.find(params[:test_id])
    @question = @test.questions.build(question_params)
    if @question.save
      redirect_to question_path(@question), notice: 'Вопрос успешно создан'
    else
      render 'new'
    end
  end

  def destroy
    @question.destroy
    redirect_to question_path
  end

  private

  def find_question
    @question = Question.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render plain: 'Вопрос не найден', status: :not_found
  end

  def question_params
    params.require(:question).permit(:body)
  end
end
