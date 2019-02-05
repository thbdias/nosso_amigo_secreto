class RemoveDateToCampaign < ActiveRecord::Migration[5.0]
  def change
    remove_column :campaigns, :event_date, :datetime
    remove_column :campaigns, :event_hour, :string
    remove_column :campaigns, :locale, :string
  end
end
