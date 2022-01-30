#model Article
class Article < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :user_access_articles

  validates :title, :slug, :description, :content, presence: true

  def self.user_articles(current_user)
    self.left_joins(:user_access_articles)
       .where('user_access_articles.user_id = ? OR articles.user_id = ?', current_user.id, current_user.id).uniq
  end

  def save_user_blog_access(users_access_ids)
    users_access_ids&.each do |u_id|
      self.user_access_articles.create(user_id: u_id)
      BlogInvitationMailer.notify(User.find(u_id), self.id).deliver_now
    end
  end
end
