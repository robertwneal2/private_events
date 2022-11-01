class AddCreatorAssosiationToEvents < ActiveRecord::Migration[7.0]
  def change
    add_belongs_to :events, :user, foreign_key: true, default: 1, null: false
  end
end
