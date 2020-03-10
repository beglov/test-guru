class Admin::TestsController < Admin::BaseController
  before_action :set_test, only: %i[show edit update destroy start]

  # GET /tests
  def index
    @tests = Test.all
  end

  # GET /tests/1
  def show
  end

  # GET /tests/new
  def new
    @test = Test.new
  end

  # GET /tests/1/edit
  def edit
  end

  # POST /tests
  def create
    @test = Test.new(test_params)
    @test.author_id = current_user.id

    if @test.save
      redirect_to admin_test_path(@test), notice: 'Test was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /tests/1
  def update
    if @test.update(test_params)
      redirect_to admin_test_path(@test), notice: 'Test was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /tests/1
  def destroy
    @test.destroy
    redirect_to admin_tests_url, notice: 'Test was successfully destroyed.'
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:category_id, :title, :level, :author_id)
  end
end
