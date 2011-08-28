class CreateAllTables < ActiveRecord::Migration
  def self.up
    create_table :agents do |t|
      t.string :name
      t.string :vote
      t.timestamps
    end

    create_table :candidates do |t|
      t.string :name
    end

    create_table :settings do |t|
      t.boolean :victor_declared
      t.boolean :voting_started
      t.timestamps
    end
  end

  def self.down
    drop_table :agents
    drop_table :candidates
    drop_table :settings
  end
end
