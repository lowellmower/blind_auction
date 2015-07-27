class AddEndDateAndDescriptionToItems < ActiveRecord::Migration
  def change
    add_column :items, :end_date, :date, null: false
    add_column :items, :description, :text, null: false
  end
end
