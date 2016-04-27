class AddSequences < ActiveRecord::Migration
  def change
    create_table :sequences do |t|
      t.string[][] :sequence_array,
      t.integer :rating
    end
  end
end
 # Works locally, but not on heroku
 #array: true, default: []