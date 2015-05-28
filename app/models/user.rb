class User < ActiveRecord::Base
recommends :music
before_save { self.email = email.downcase }
before_create :create_remember_token
validates :name, length: { maximum: 50}
validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: { case_sensitive: false }
has_secure_password
validates :password, length: { minimum: 6 }
validates_presence_of :name, :email   

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
end
