require 'rails_helper'

RSpec.describe User, type: :model do
    #tests go here
    subject{User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', post_counter:0)}
    
    before{subject.save}

    it 'Name should be not blank' do
        subject.name = nil
        expect(subject).to_not be_valid
    end

    it "post counter should not be negative" do
        subject.post_counter = -1
        expect(subject).to_not be_valid
    end

    it "post counter should be integer" do
        subject.post_counter = 3.21
        expect(subject).to_not be_valid

        subject.post_counter = "Hello World"
        expect(subject).to_not be_valid

        subject.post_counter = true
        expect(subject).to_not be_valid
    end

end