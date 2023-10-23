class QuestionsController < ApplicationController
  before_action :find_test, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  
  def index
    @questions = @test.questions
  end

  def show
    @questions = @test.questions.find(params[:id])
  end

  def new
    @question = @test.questions.build
  end

  def create
    @question = @test.questions.find(params[:id])
    @questions.destroy
    redirect_to test_questions_path(@test), notice: "Вопрос успешно удалён"
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def question_params
    params.require(:question).permit(:body)
  end
end
