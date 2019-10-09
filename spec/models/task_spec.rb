require 'rails_helper'

RSpec.describe Task, type: :model do

  it "Validation does not pass if the title is empty" do
    task = Task.new(name: '', content: 'Failure test')
    expect(task).not_to be_valid
  end

  it "Validation does not pass if content is empty" do
    # Describe the contents here
  end

  it "validation passes If content is described in title and content" do
    # Describe the contents here
  end
end