class TodosController < ApplicationController
  #respond_to :html, :js
  before_action :authenticate_user!

  def index
    @user = current_user
    @todos = current_user.todos
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    @todo.user = current_user
    if @todo.save
      redirect_to @todo, notice: 'Your new TODO was saved'
    else
      flash[:notice] = "Description may not be blank"
      render "new"
    end
  end

  def show
    @todo = Todo.find(params[:id])
  end

  def destroy
    # note: assume only ajax request
    @todo = Todo.find(params[:id])
    if @todo.destroy
      render nothing: true
    else
      render file: "todos/destroy.js.erb", content_type: "application/javascript"
    end
  end

private

  def todo_params
    params.require(:todo).permit(:description)
  end
end
