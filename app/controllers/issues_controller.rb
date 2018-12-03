class IssuesController < ApplicationController
  def new
  end

  def edit
  end

  def list
    @issues = Issue.all
  end
end
