class AddCommentableIdComments < ActiveRecord::Migration
  def change
    #rename_column :comments, :post_id, :commentable_id
    add_column :comments, :commentable_id, :integer   
    remove_column :comments, :post_id
  end
end
