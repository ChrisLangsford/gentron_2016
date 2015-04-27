class FeedbackMailer < ActionMailer::Base
	default from: "scanner@gentron.local"
  def feedback_email(feedback)
  	@feedback = feedback
  	mail(to: "info@gentron.co.za", subject: "Feedback submitted by #{@feedback.company_name}")
  end
end
