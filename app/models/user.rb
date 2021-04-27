class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :username
    with_options format: { with: /\A[ぁ-んァ-ン一-龥々]/, message: 'is invalid Input full-width characters' } do
      validates :last_name
      validates :first_name
    end
    with_options format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid Input full-width katakana characters' } do
      validates :last_name_kana
      validates :first_name_kana
    end
    validates :birth
  end
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'Please include both letters and numbers'
  validates :email, uniqueness: { case_sensitive: false }
end
