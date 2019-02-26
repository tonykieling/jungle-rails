class User < ActiveRecord::Base
  has_secure_password
  validates :first_name,  presence: true
  validates :last_name,   presence: true
  validates :email,       presence: true, uniqueness: true
  validates :password, :length => {:minimum => 8 }
  # validates :password, :length =>{
  #   :minimum => 90,
  #   :too_short => "password is too short, must be at least #{minimum} characters"
  # }, :on => :create

  has_many :reviews
end
