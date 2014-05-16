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

  describe "#time_left" do
    it "returns 2 for a 5 day old task" do
      todo = FactoryGirl.build(:todo)
      todo.created_at = Time.now - 5.days

      expect(todo.time_left).to be(2)
    end
  end

end
