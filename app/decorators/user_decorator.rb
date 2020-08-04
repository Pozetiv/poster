class UserDecorator < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def subscribe_or_unsubscribe(subscible)
    subscribe = model.subscribes.where(subscible_id: subscible[:id], subscible_type: subscible[:type])
    if subscribe.present?
      h.link_to 'Unsubscribe', h.subscribe_path(subscribe.first), method: :delete, confirm: { data: 'Unsubscribe?' }
    else
      h.button_to 'Subscribe', h.subscribes_path(subscribe: {subscible_id: subscible[:id], subscible_type: subscible[:type]})
    end
  end
end
