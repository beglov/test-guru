class TestPassagesController < ApplicationController
  before_action :set_test_passage

  def show
  end

  def result
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      UserBadgeService.new(@test_passage)
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    service = GistQuestionService.new(@test_passage.current_question)
    result = service.call

    flash_options = if service.success?
                      current_user.gists.create(question: @test_passage.current_question, github_id: result.id)
                      {notice: t('.success', url: result[:html_url])}
                    else
                      {alert: t('.failure')}
                    end

    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
