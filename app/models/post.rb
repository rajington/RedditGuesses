class Post < ActiveRecord::Base
  validates :url, :format => URI::regexp(%w(http https))
  has_many :submissions, :dependent => :delete_all
  
  before_save :update_info
  
  protected
  def update_info
    response = HTTParty.get(url + ".json", :query => {:depth => 1})
    json = JSON.parse(response.body)

    if name.nil?
      self.name = json[0]["data"]["children"][0]["data"]["title"]
    end

    json[1]["data"]["children"].each do |comment|
      author = body = comment["data"]["author"]
      body = comment["data"]["body"]
      if !body.nil?
        number = body.scan(/[0-9]+(?:\.[0-9]*)?/).first
        if !number.nil? && !submissions.where(:author => author).present?
          submissions.new(:guess => number, :author => author)
        end
      end
    end
  end
end
