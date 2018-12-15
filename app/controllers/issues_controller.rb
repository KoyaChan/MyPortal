class IssuesController < ApplicationController
  include IssuesHelper
  def new
    @issue = Issue.new
  end

  def edit
    @issue = Issue.find(params[:id])
  end

  def index
    @issues = Issue.all
  end

  def show
    redirect_to issues_path
  end

  def create
    @issue = Issue.new(issue_params)
    @issue.logpath = logpath
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
      render 'edit'
    end
  end

  def logpath
    return logfile_path_for(@issue) unless @issue.nil?
    nil
  end

  private

    def issue_params
      params[:number] = params[:number].to_i
      params.require(:issue).permit(:number,
                                    :subject,
                                    :logpath,
                                    :salesforce_url,
                                    :ftp_url,
                                    :fix)
    end
end
