# ApplicationMailer はメール処理の基底となるクラス
class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end
