class IssuesController < ApplicationController
  include IssuesHelper

  def new
    issue_num = params[:number]
    @issue = Issue.find_by(number: issue_num)

    @issue ||= Issue.new
    @issue.number = issue_num
    @issue.archived = false
  end

  def edit
    @issue = Issue.find(params[:id])
  end

  def index
    @issues = Issue.sorted_all
  end

  def search
    redirect_to new_issue_path(number: params[:number])
  end

  def show
    redirect_to issues_path
  end

  def create
    @issue = Issue.new(issue_params)
    if @issue.save
      redirect_to issues_path
    else
      render 'new'
    end
  end

  def update
    @issue = Issue.find(params[:id])
    if @issue.update_attributes(issue_params)
      redirect_to issues_path
    else
      render 'edit', action: :index
    end
  end

  def destroy
    issue = Issue.find(params[:id])
    issue.archived = true
    issue.save
    redirect_to issues_path
  end

  private

    def issue_params
      params.require(:issue).permit(:number,
                                    :subject,
                                    :logpath,
                                    :salesforce_url,
                                    :ftp_url,
                                    :fix,
                                    :memo,
                                    :archived)
    end
end
