class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :flashcards
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable
  validates :email, presence: true, uniqueness: true
  validate :password_complexity
  def self.find_or_create_from_auth_hash(auth_hash)
      where(provider: auth_hash.provider, uid: auth_hash.uid).first_or_create do |user|
          user.provider = auth_hash.provider
          user.uid = auth_hash.uid
          user.email = auth_hash.info.email
          user.password = Devise.friendly_token[0,20]
      end
  end

  private

  def password_complexity
      if password.present? and not password.match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)./)
      errors.add :password, "must include at least one lowercase letter, one uppercase letter, and one digit"
    end
  end
end
