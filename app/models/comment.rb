# == Schema Information
#
# Table name: comments
#
#  id                :integer          not null, primary key
#  content           :string
#  user_id           :integer
#  post_id           :integer
#  parent_comment_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Comment < ActiveRecord::Base

  validates :content, :user, :post, presence: true

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
