class EntryDecorator < Draper::Decorator
  delegate_all

  def date_ago
    "#{h.time_ago_in_words(entry.created_at)} ago"
  end

  def my_date
    object.date.strftime("%m/%d/%Y, at %I:%M%p") if object.date.present?
  end

  def entry_description
    entry.description.humanize
  end

  def patient
     "#{entry.user.firstname.humanize} #{entry.user.lastname.humanize}"
  end

	def examination_type_collection
    Entry.examination_types.map do |type, _|
      [I18n.t(type, scope: :examination_types), type]
    end
	end

  def name
    I18n.t(object.examination_type, scope: :examination_types)
  end

  def value_with_unit
    object.value.to_s + " " + I18n.t(object.examination_type, scope: :examination_units)
  end

  def examination_type
    I18n.t(object.examination_type, scope: :examination_types)
  end

  def chart_date
    entry.date.to_date
  end

end
