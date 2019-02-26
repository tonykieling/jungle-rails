class User < ActiveRecord::Base
  has_secure_password

  validates :first_name,  presence: true
  validates :last_name,   presence: true
  validates :email,       presence: true
  validates_uniqueness_of :email, case_sensitive: true
  validates :password,    length: { minimum: 8 }

  has_many :reviews


  def self.authenticate_with_credentials (email, password)
    user = User.find_by_email(email)

    # If the user exists AND the password entered is correct.
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end

end
