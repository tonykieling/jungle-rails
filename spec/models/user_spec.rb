require 'rails_helper'

RSpec.describe User, :type => :model do
  subject { described_class.new(
                                first_name: 'Tony',
                                last_name: 'Kieling',
                                password: "some_password",
                                password_confirmation: "some_password",
                                email: "tk@email.ca") }

  describe "Validations" do
    it "is valid with valid attributes" do
    #   # user = User.new first_name: 'Tony', last_name: 'Kieling', email: 'tk@email.ca'
    #   # user.password = 'passwd'
    #   # user.password_confirmation = 'passwd'
    #   subject.save
      expect(subject).to be_valid
      puts subject.errors.full_messages
    end

    it "is not valid without first_name" do
      subject.first_name = ""
      expect(subject).to_not be_valid
      puts subject.errors.full_messages
    end

    it "is not valid without last_name" do
      subject.last_name = ""
      expect(subject).to_not be_valid
      puts subject.errors.full_messages
    end

    it "is not valid when the password and password_confirmation don't match" do
      subject.password_confirmation = "some_passwordDIFFERENT"
      expect(subject).to_not be_valid
      puts subject.errors.full_messages
    end

    it "is not valid without an email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it "validates password length" do
      user = User.new first_name: 'a', last_name: 'b', email: 'tka@email.ca'
      user.password = 'passwd'
      user.password_confirmation = 'passwd'
      user.save
      expect(user).to_not be_valid
      # FactoryGirl.build(:user, password: "12345678").should be_valid
    end

    
    # it "is not valid for duplicated email" do
    # # it {should validate_uniqueness_of(:email).ignoring_case_sensitivity} do
    #   user1 = User.new first_name: 'Another', last_name: 'Kieling', email: 'TK@EMAIL.CA'
    #   user1.password = '888passwd'
    #   user1.password_confirmation = '888passwd'
    #   user1.save
    #   puts user1.email
    #   user2 = User.new first_name: 'OneMore', last_name: 'Kieling', email: 'tk@email.ca'
    #   user2.password = '888passwd8'
    #   user2.password_confirmation = '888passwd8'
    #   user2.save
    #   puts user2.email

    #   expect(user1).to_not be_valid
    # end

  end

end
