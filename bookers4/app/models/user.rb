class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: 2..20
  validates :plofile, length:{ maximum: 50, too_long: "This is the error. Please enter within 50 characters"}

  def email_required?
  	false
  end
  def email_changed?
  	false
  end

  attachment :profile_image

  has_many :books, dependent: :destroy
end
