class QuestionsController < ApplicationController
  before_action :find_test
  before_action :find_question, only: %i[show destroy]

  def index
    @questions = @test.questions
    render plain: @questions.map(&:content).join("\n"), status: :ok
  end

  def show
    render plain: @question.content, status: :ok
  end

  def new
    @question = @test.questions.new
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      render plain: 'Question was successfully created!', status: :created
    else
      render plain: 'Question creation failed!', status: :unprocessable_entity
    end
  end

  def destroy
    @question.destroy
    render plain: 'Question was successfully deleted!', status: :ok
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  rescue ActiveRecord::RecordNotFound
    render plain: 'Test not found', status: :not_found
  end

  def find_question
    @question = @test.questions.find_by(id: params[:id])
    render plain: 'Question not found', status: :not_found unless @question
  end

  def question_params
    params.require(:question).permit(:content)
  end
end
