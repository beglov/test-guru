class FeedbackController < ApplicationController
  def message
  end

  def send_message
    FeedbackMailer.feedback(current_user, params[:message]).deliver_now
    redirect_to tests_path, notice: t('.success')
  end
end
