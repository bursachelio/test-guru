class TestsController < ApplicationController
  before_action :set_test, only: %i[show edit update destroy]

  def start
    set_test
    set_user
    @user.tests.push(@test)
    redirect_to @user.result(@test)
  end

  def set_user
    @user = User.first
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
    params.require(:test).permit(:title, :level, :author_id, :category_id)
  end
end
