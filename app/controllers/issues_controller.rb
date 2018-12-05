class IssuesController < ApplicationController
  include IssuesHelper
  def new
    @issue = Issue.new
  end

  def edit
  end

  def index
    @issues = Issue.all
  end

  def create
    @issue = Issue.new(issue_params)
    @issue.logpath = logpath
    @issue.save
    redirect_to issues_path
  end

  def logpath
    return [logfile_path_for(@issue)] unless @issue.nil?
    [nil]
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
