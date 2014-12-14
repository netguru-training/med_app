class AlertDecorator < Draper::Decorator

  def date
    object.created_at.strftime("%m/%d/%Y, at %I:%M%p")
  end

  def content
    object.content
  end

  def acknowledge
    object.acknowledge
  end

  def alert_color
    if acknowledge
      'alert-success'
    else
      'alert-danger'
    end
  end

  def glyphicon
    if acknowledge
      'glyphicon-ok-sign'
    else
      'glyphicon-exclamation-sign'
    end
  end

  def check
    if !acknowledge
      h.link_to 'Check', alert, method: :put, class: 'btn-sm btn-primary'
    end

  end

end
