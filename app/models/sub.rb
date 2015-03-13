class Sub < ActiveRecord::Base

  # has_many :post_subs
  #
  # has_many(
  # :posts,
  # through: :post_subs,
  # source: :post
  # )

  has_many :posts

  belongs_to(
  :moderator,
  class_name: "User"
  )
end
