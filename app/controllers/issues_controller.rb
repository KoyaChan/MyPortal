class IssuesController < ApplicationController
  def new
    issue_num = params[:number]
    cft_num = params[:cft_number]

    @issue = Issue.find_by(number: issue_num) if issue_num.present?
    @issue ||= Issue.find_by(cft_number: cft_num) if cft_num.present?
    @issue ||= Issue.new

    @issue.number = issue_num if issue_num.present?
    @issue.cft_number = cft_num if cft_num.present?
    @issue.archived = false
  end

  def edit
    @issue = Issue.find(params[:id])
  end

  def index
    @issues = Issue.sorted_all
  end

  def search
    redirect_to new_issue_path(number: params[:number], cft_number: params[:cft_number])
  end

  def show
    redirect_to issues_path
  end

  def canceled
    params[:cancel]
  end

  def create
    if canceled
      redirect_to issues_path
      return
    end

    @issue = Issue.new(issue_params)
    if @issue.save
      @issue.todos.new(status: '新規', action: nil).save
      redirect_to issues_path
    else
      render 'new'
    end
  end

  def update
    if canceled
      redirect_to issues_path
      return
    end

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
                                    :cft_number,
                                    :subject,
                                    :logpath,
                                    :memopath,
                                    :salesforce_url,
                                    :jira_url,
                                    :ftp_url,
                                    :fix,
                                    :memo,
                                    :archived)
    end
end
