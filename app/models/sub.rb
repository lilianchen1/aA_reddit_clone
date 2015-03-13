class Sub < ActiveRecord::Base

  has_many :post_subs, dependent: :destroy

  has_many(
  :posts,
  through: :post_subs,
  source: :post
  )


  belongs_to(
  :moderator,
  class_name: "User"
  )
end
