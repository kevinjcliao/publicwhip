class RenamePwVoteTable < ActiveRecord::Migration
  def change
    rename_table :pw_vote, :votes
  end
end
