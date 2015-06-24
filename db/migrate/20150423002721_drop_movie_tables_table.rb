class DropMovieTablesTable < ActiveRecord::Migration
  def change
    drop_table :movie_tables
  end
end
