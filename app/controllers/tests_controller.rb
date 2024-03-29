class TestsController < ApplicationController
  before_action :set_test, only: %i[start show edit update destroy]
  before_action :authenticate_user!

  def start
    current_user.tests.push(@test)
    redirect_to current_user.result(@test)
  end

  def index
    @tests = Test.all
  end

  def show
    @questions = @test.questions
  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)
    @test.author_id = current_user.id
  
    if @test.save
      redirect_to @test
    else
      render :new 
    end
  end

  def edit 
  end
  
  def update
    if @test.update(test_params)
      redirect_to @test
    else
      render :edit 
    end
  end

  def destroy
    @test.destroy
    redirect_to tests_path
  end
  
  private

  def set_test
    @test = Test.find(params[:id])
  end
  
  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end
end
