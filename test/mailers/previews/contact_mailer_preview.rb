# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview

    def contact_email
        ContactMailer.contact_email("TestCustomer@test.com", "Test Customer", "1234567890", @message = "This is a test message")
    end


end
