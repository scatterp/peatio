class BaseMailer < ActionMailer::Base
  layout 'mailers/application'
  add_template_helper MailerHelper

  default from: ENV['SYSTEM_MAIL_FROM'],
          reply_to: ENV['SUPPORT_MAIL']
end
