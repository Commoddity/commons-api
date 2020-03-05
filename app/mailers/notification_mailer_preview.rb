class NotificationMailer < ActionMailer::Preview
  # Accessible from http://localhost:3001/rails/mailers/notification/send_notification_email
  def send_notification_email
    Notifier.send_notification_email(User.first)
  end
end