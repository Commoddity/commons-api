class SaveUser
  include Interactor
  # Called by Users controller
  # This organizer runs through the process of creating a new user

  def call
    if user = User.create!(
      name: context.name, 
      username: context.username, 
      email: context.email, 
      password: context.password, 
      password_confirmation: context.password_confirmation, 
      sms_notification: context.sms_notification, 
      email_notification: context.email_notification, 
      phone_number: context.phone_number)
      user.save
      context.user = user
    else
      context.fail!(message: "create_user.failure")
    end
  end

end
