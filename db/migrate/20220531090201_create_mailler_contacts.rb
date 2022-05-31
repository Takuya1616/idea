class CreateMaillerContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :mailler_contacts do |t|
      def contact_mail(contact, user)
        @contact = contact
        mail to: user.email, bcc: ENV["ACTION_MAILER_USER"], subject: "お問い合わせについて【自動送信】"
      end

      t.timestamps
    end
  end
end
