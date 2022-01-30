#mailer BlogInvitationMailer
class BlogInvitationMailer < ApplicationMailer
  def notify(user, article_id)
    @article_id = article_id
    @user = user
    mail(to: user.email,
         subject: 'Welcome to Blog!')
  end
end
