class AddCommentableIdComments < ActiveRecord::Migration
  def change
    rename_column :comments, :post_id, :commentable_id
  end
end
