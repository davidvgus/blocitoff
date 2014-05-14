require 'spec_helper'

describe Todo do
  it "should not be valid with blank description" do
    todo = Todo.new

    expect(todo).to be_invalid
  end
end
