class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :posts, dependent: :destroy
  has_many :assignments, dependent: :destroy
  has_many :assignment_notes, dependent: :destroy
  has_many :assignment_contacts
  has_many :tasks, dependent: :destroy

  devise :database_authenticatable, :registerable, :rememberable, :trackable, :validatable

  enum role: [:estimator, :manager, :admin]

end # end user model
