require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  # should get whe root page of the web app.
  test "should get home" do
    get root_url
    assert_response :success

    assert_select 'h1','Book your seat.'
    assert_select 'p','Use this web app to book seats at CineView cinemas.'
  end

  # Should show the contact page.
  test "should get contact" do
    get contact_url
    assert_response :success
    
    assert_select 'h1','Contact Us'
    assert_select 'p', 'Complete the form below to get in contact with us.'
  end

  # Shows a flash notification if no email provided
  test "should post request contact but no email" do
    post request_contact_url
    assert_response :redirect
    assert_not_empty flash[:alert]
    assert_nil flash[:notice]
  end

  # should show a notification one a valid message has been sent.
  test "should post request contact" do
    post request_contact_url, params:{name: "John", email: "JohnSmith@gmail.com",telephone: "1234567890", message: "This is a test message"}
    assert_response :redirect
    assert_nil flash[:alert]
    assert_not_empty flash[:notice]
  end


end
