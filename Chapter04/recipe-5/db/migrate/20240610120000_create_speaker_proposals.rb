class CreateSpeakerProposals < ActiveRecord::Migration[6.1]
  def change
    create_table :speaker_proposals do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :talk_title, limit: 100, null: false
      t.text :talk_description, limit: 500, null: false
      t.string :track, null: false
      t.string :audience_level, null: false
      t.text :bio, limit: 250
      t.integer :duration, null: false
      t.boolean :terms_of_participation, default: false
      t.timestamps
    end
  end
end 