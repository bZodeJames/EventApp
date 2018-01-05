class AddEventTypeToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :event_type, :integer, default: 0 
  end
end
