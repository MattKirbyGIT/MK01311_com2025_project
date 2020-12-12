# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview

    # Preview text for a valid email sent through the mailer
    def contact_email
        ContactMailer.contact_email("TestCustomer@test.com", "Test Customer", "1234567890", @message = "This is a test message")
    end


end
