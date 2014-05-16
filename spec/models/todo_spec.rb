require 'spec_helper'

describe Todo do
  it "should not be valid with blank description" do
    todo = Todo.new

    expect(todo).to be_invalid
  end

  it "should not be valid without user" do
    user = FactoryGirl.build(:user)
    todo = FactoryGirl.build(:todo, user: user)

    expect(todo.user).to_not be_nil
  end
end
