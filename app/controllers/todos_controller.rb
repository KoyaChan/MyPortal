class TodosController < ApplicationController
  def create
    todo = Todo.new(todo_params)
    debugger
    todo.save
    redirect_to issues_path
  end

  private
    def todo_params
      params.require(:todo).permit(issue_id,
                                   :status,
                                   :action)
    end
end
