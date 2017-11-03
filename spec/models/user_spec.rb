require 'spec_helper'
require_relative '../../app/models/application_record.rb'
require_relative '../../app/models/user.rb'

describe 'User' do

  before(:each) do
    create_db
    migrate
    random_string = (0...6).map { (97 + rand(26)).chr }.join
    @user = User.new(email: "#{random_string}@thisuser.com", password: 'random_string', password_confirmation: 'random_string')
  end

  # before {@user = User.new(email: "testing@thisuser.com", password: '123123', password_confirmation: '123123')}

  subject { @user }

  it {should respond_to(:email)}
  it {should respond_to(:password)}
  it {should respond_to(:password_confirmation)}

  it {should be_valid}

  after(:each) { drop_db }
end
