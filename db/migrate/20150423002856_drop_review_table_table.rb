class DropReviewTableTable < ActiveRecord::Migration
  def change
    drop_table :reviews_tables
  end
end
