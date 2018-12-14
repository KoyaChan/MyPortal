FactoryBot.define do
  factory :valid_issue, class: Issue do
    number { '00521373' }
    subject { 'arcserve UDP稼働サーバーの再起動時に出力されるmdpファイルにつきまして' }
    logpath { '' }
    salesforce_url { '' }
    ftp_url { '' }
    fix { '' }
  end
end
