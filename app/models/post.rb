class Post < ActiveRecord::Base
  validates :title, :sub_id, :user_id, presence: true

  belongs_to :user
  # has_many :post_subs
  #
  # has_many(
  # :subs,
  # through: :post_subs,
  # source: :sub
  # )

  belongs_to :sub


end
