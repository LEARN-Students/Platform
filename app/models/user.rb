class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :flashcards
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable
  def self.find_or_create_from_auth_hash(auth_hash)
      where(provider: auth_hash.provider, uid: auth_hash.uid).first_or_create do |user|
          user.provider = auth_hash.provider
          user.uid = auth_hash.uid
          user.email = auth_hash.info.email
          user.password = Devise.friendly_token[0,20]
      end
  end
end
