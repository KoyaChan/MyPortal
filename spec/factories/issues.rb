FactoryBot.define do
  factory :issue do
    number { "" }
    subject { "MyString" }
    logpath { "MyString" }
    salesforce_url { "MyString" }
    ftp_url { "MyString" }
    fix { "MyString" }
  end
end
