class Admin::QuestionsController < Admin::BaseController
  before_action :find_test, only: %i[index new create]
  before_action :find_question, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  # GET /questions/1
  def show
  end

  # GET /questions/new
  def new
    @question = @test.questions.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to admin_question_path(@question), notice: 'Question was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /questions/1
  def update
    if @question.update(question_params)
      redirect_to admin_question_path(@question), notice: 'Question was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /questions/1
  def destroy
    @question.destroy
    redirect_to admin_test_path(@question.test), notice: 'Question was successfully destroyed.'
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render html: '<h1>Вопрос не найден!</h1>'.html_safe
  end
end
