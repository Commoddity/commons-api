# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  has_many :bill_users
  has_many :category_users

  has_many :bills, through: :bill_users
  has_many :categories, through: :category_users

  validates :name, presence: true, allow_blank: false
  validates :username, uniqueness: true, length: { minimum: 4 }, presence: true, allow_blank: false, format: { with: /\A[a-zA-Z0-9 _-]+\z/ }
  validates :email, presence: true, uniqueness: true
  validates :password, confirmation: true, length: { minimum: 5 }, on: :create
  validates :password_confirmation, presence: true, on: :create
  validates :password, confirmation: true, length: { minimum: 5 }, if: :password, on: :update
  validates :password_confirmation, presence: true, if: :password, on: :update
end
