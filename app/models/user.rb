class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :posts
  has_many :assignments
  has_many :assignment_notes
  has_many :tasks

  devise :database_authenticatable, :registerable, :rememberable, :trackable, :validatable

  enum role: [:estimator, :manager, :admin]

end # end user model
