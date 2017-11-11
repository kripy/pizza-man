Sequel.migration do
  change do
    create_table(:customers) do
      primary_key :id
      String      :first_name
      String      :last_name
      String      :mobile
      TrueClass   :mobile_subscriber
      String      :email_address
      TrueClass   :email_subscriber
    end
  end
end
