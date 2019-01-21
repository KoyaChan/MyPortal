class TodosController < ApplicationController
  def create
    issue = Issue.find(params[:issue_id])
    todo = issue.todos.new(todo_params)
    todo.save
    redirect_to issues_path
  end

  def destroy
    todo = Todo.find(params[:id])
    todo.destroy
    redirect_to issues_path
  end

  private
    def todo_params
      params.require(:todo).permit(:status,
                                   :action)
    end
end
