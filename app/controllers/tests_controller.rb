class TestsController < ApplicationController
  before_action :set_test, only: %i[show edit update destroy]
  before_action :authenticate_user!
  before_action :logged_in_user

  def start
    @test = Test.find(params[:id])
    @user = current_user
    @user.tests.push(@test)
    redirect_to @user.result(@test)
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

  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end
end
