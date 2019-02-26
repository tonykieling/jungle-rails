require 'rails_helper'
# https://www.rubypigeon.com/posts/rspec-expectations-cheat-sheet/
# https://relishapp.com/rspec/rspec-expectations/v/3-8/docs/built-in-matchers/be-matchers
# rspec spec/models/user_spec.rb:104 --format documentation   ###line number after the file name



RSpec.describe User, :type => :model do
  subject { described_class.create(
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
      # subject.save
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
    
  end

  describe '.authenticate_with_credentials' do
    it "is valid" do
      user = User.new first_name: 'a', last_name: 'b', email: 'tka@email.ca'
      user.password = 'passwd1234'
      user.password_confirmation = 'passwd1234'
      user.save
      User.authenticate_with_credentials(user.email, user.password)
      expect(user).to be_valid
    end

    it "whithout email is NOT valid" do
      user = User.new first_name: 'a', last_name: 'b', email: ''
      user.password = 'passwd1234'
      user.password_confirmation = 'passwd1234'
      User.authenticate_with_credentials(user.email, user.password)
      user.save
      expect(user).to_not be_valid
    end

    it "email CAPSLOCK is NOT valid" do
      user = User.new first_name: 'a', last_name: 'b', email: 'tk@email.ca'
      user.password = 'passwd1234'
      user.password_confirmation = 'passwd1234'
      user.save
      temp = User.authenticate_with_credentials('tK@email.ca', 'passwd1234')
      expect(temp).not_to eq(user)
    end

    it "email CAPSLOCK is NOT valid" do
      user = User.new first_name: 'a', last_name: 'b', email: 'tk@email.ca'
      user.password = 'passwd1234'
      user.password_confirmation = 'passwd1234'
      user.save
      temp = User.authenticate_with_credentials(' tK@email.ca', 'passwd1234')
      expect(temp).not_to eq(user)
    end

  end


end
