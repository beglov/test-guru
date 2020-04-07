class FeedbackMailer < ApplicationMailer
  def feedback(user, message)
    @user = user
    @message = message

    mail to: Admin.pluck(:email)
  end
end
