require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(username: "Siobhan", email: "siobhan@test.com", password: "password")}

  before { subject.save }

  it 'username should be present' do
    subject.username = nil
    expect(subject).to_not be_valid
  end

  it 'email should be present' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'password should be present' do
    subject.password = nil
    expect(subject).to_not be_valid
  end

  it 'password should not be too short' do
    expect(subject.password.length).to be >= 6
  end
end
