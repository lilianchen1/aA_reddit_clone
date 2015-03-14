# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  url        :string
#  content    :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ActiveRecord::Base
  # attr_reader :in_subs
  validates :title, :user, presence: true

  belongs_to :user
  has_many :post_subs, dependent: :destroy

  has_many(
    :subs,
    through: :post_subs,
    source: :sub
  )

  has_many :comments
  # def sub_ids=(sub_ids)
  #   in_subs=[]
  #   sub_ids.each do |sub_id|
  #     in_subs += [PostSub.new(sub_id: sub_id, post_id: self.id)]
  #   end
  #   @in_subs=in_subs
  # end

end
