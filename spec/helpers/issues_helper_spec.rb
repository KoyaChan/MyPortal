require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the IssuesHelper. For example:
#
# describe IssuesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe IssuesHelper, type: :helper do
  describe 'logfile_path_for' do
    it 'makes a url to the same file name as the issue number' do
      issue_number = 382_645
      expected_path = 'file://E:\work\temp\temp\382645'

      issue_mock = double('Issue')
      allow(issue_mock).to receive(:number).and_return(issue_number)
      expect(logfile_path_for(issue_mock)).to eq(expected_path)
    end
  end
end
