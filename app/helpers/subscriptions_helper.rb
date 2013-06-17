module SubscriptionsHelper

  def subscribe_button anime_show
    if guest_or_current_user.is_subscribed?(anime_show)
      button_to "Unsubscribe", subscription_path(:id => anime_show), :method => 'delete'
    else
      button_to "Subscribe", subscriptions_path(:anime_show_id => anime_show), :method => 'post'
    end
  end

end
