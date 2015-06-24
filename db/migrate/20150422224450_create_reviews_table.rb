class CreateReviewsTable < ActiveRecord::Migration
  def change
    create_table :reviews_tables do |t|
      t.text :body
      t.integer :movie_id
    end
  end
end
