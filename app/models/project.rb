class Project < ActiveRecord::Base
	validates :title, :description, :presence => true
	has_many :user_projects
	has_many :users, through: :user_projects
	belongs_to :user
	has_many :posts
end
