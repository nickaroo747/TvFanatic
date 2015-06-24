class DeleteMovieTable < ActiveRecord::Migration
  def change
    drop_table :MovieTable
  end
end
