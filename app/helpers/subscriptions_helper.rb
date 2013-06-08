module SubscriptionsHelper

  def subscribe_button anime_show
    button_to "Subscribe", subscriptions_path(:anime_show_id => anime_show), :method => 'post'
  end

end
