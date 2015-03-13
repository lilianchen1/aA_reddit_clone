class Comment < ActiveRecord::Base

  belongs_to :user
  belongs_to :post

  belongs_to(
    :parent_comment,
    foreign_key: :parent_comment_id,
    class_name: :Comment,
    primary_key: :id
    )

  has_many(
  :child_comments,
  foreign_key: :parent_comment_id,
  class_name: :Comment,
  primary_key: :id
  )

end
