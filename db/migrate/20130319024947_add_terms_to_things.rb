class AddTermsToThings < ActiveRecord::Migration
  def change
    add_column :things, :terms, :boolean, :default => false
  end
end
