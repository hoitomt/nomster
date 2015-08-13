class NotificationMailer < ApplicationMailer
  default from: "no-reply@nomster.com"

  def comment_added
    mail(to: "mike.hoitomt@gmail.com", subject: "A comment has been added to your place")
  end
end
