# Preview all emails at http://localhost:3000/rails/mailers/feedback_mailer
class FeedbackMailerPreview < ActionMailer::Preview
  def feedback
    user = User.first
    FeedbackMailer.feedback(user, 'Какой замечательный сайт!')
  end
end
