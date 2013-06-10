class Episode < ActiveRecord::Base
  after_create :download_episode

  belongs_to :anime_show
  attr_accessible :name, :number, :url, :image_url, :video_file, :video

  validates :name, :number, :url, :anime_show_id, :presence => true
  validates :number, :uniqueness => { :scope => :anime_show_id }

  default_scope order("episodes.created_at DESC")
  scope :unseen_episodes, lambda { |user| where("episodes.id NOT IN (?)", user.user_seen_episodes.select(:episode_id).map(&:episode_id)) }

  has_attached_file :video,
  :storage => :aws,
  :s3_bucket => ENV["AWS_BUCKET"],
  :s3_credentials => {
        :access_key_id => ENV["AWS_ACCESS_KEY_ID"],
        :secret_access_key => ENV["AWS_SECRET_ACCESS_KEY"],
        :endpoint => 'objects.dreamhost.com'
      },
  :s3_permissions => :public_read,
  :path => ":attachment/:show/:style/:basename_:id.:extension"

  Paperclip.interpolates :show  do |attachment, style|
    attachment.instance.anime_show.name
  end

  Paperclip.interpolates :number  do |attachment, style|
    attachment.instance.anime_show.number
  end

  def video_remote_url(url_value)
    self.video = download_remote_file(url_value)
    self.video
  end

  private

  def download_remote_file(url)
    # OpenURI extends Kernel.open to handle URLs as files
    io = open(url)

    # overrides Paperclip::Upfile#original_filename;
    # we are creating a singleton method on specific object ('io')
    def io.original_filename
      base_uri.path.split('/').last
    end

    io.original_filename.blank? ? nil : io
  end

  def download_episode
    GetMp4.delay.get_video(self) unless Rails.env.eql?('test')
  end
end
