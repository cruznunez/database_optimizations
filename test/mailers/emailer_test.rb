require 'test_helper'

class EmailerTest < ActionMailer::TestCase
  test "all_data" do
    mail = Emailer.all_data
    assert_equal "All data", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
