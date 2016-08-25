class TodosController < ApplicationController
  before_action :authenticate!
  def index
@todos = @current_user.todos
@todo = Todo.new
  end

  def show
  end

  def new
  end

  def create
todo = Todo.new(todo_params)
todo.user_id = @current_user.id

if  todo.save
redirect_to todos_path
end
  end

  def update
todo = Todo.find(params[:id])
todo.update(todo_params)
redirect_to todos_path
end

  def destroy
  todo = Todo.find(params[:id])
  todo.delete
  redirect_to todos_path
  end

  def edit
  @todo = @current_user.find(params[:id])
  end
private
  def todo_params
params.require(:todo).permit(:title,:remark,:is_finished)
  end

  def authenticate!
    @current_user = User.find_by(id:session[:user_id])
    if @current_user.blank?
      redirect_to login_path and return
    end
  end


end
