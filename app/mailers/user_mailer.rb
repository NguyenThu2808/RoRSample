class UserMailer < ApplicationMailer
  def account_activation user
    @user = user
    mail to: user.email, subject: t ".account_acctivation"
  end

  def password_reset
    @greeting = t ".hi"
    mail to: Settings.mailto
  end
end
