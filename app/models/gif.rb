class Gif < ActiveRecord::Base
  belongs_to :category
  has_many :favorites
  has_many :users, through: :favorites

  def self.generate_gif(search_term)
    search = search_term.gsub(' ', '+')
    uri = URI("http://api.giphy.com/v1/gifs/search?q=#{search}&limit=100&api_key=dc6zaTOxFJmzC")
    response = Net::HTTP.get uri
    giphy = JSON.parse response
    gif = giphy['data'].sample
    { uid: gif['id'], url: gif['images']['original']['url'] }
  end
end
