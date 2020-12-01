require 'test_helper'

class ContactMailerTest < ActionMailer::TestCase
  
  test "should return email" do
    mail = ContactMailer.contact_email("test@email.com", "Test Name", "1234567890", @message = "Test message")
    
    assert_equal ['hello@cineview.com'], mail.to
    assert_equal ['hello@cineview.com'], mail.from
  end

end
