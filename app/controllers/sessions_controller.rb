# frozen_string_literal: true

class SessionsController < ApplicationController
  def create
    user = User.find_by(email: session_params[:email])

    if user
      user_with_bills = LoginUser.call(user: user, password: session_params[:password])
      user_result = user_with_bills.user
      session[:user_id] = user.id
      render json: {
        status: :created,
        user: user_result
      }
    else
      render json: {
        status: 401,
        errors: ['Invalid username or password.']
      }
    end
  end

  def is_logged_in?
    if logged_in? && current_user
      user_with_bills = ReturnUserWithBills.call(user: current_user)
      user_result = user_with_bills.user
      render json: {
        logged_in: true,
        user: user_result
      }
    else
      render json: {
        logged_in: false,
        message: 'no such user'
      }
    end
  end

  def destroy
    logout!
    render json: {
      status: 200,
      logged_out: true
    }
  end

  private

  def session_params
    params.require(:user).permit(:username, :email, :password)
  end
end
