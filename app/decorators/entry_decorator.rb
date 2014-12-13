class EntryDecorator < Draper::Decorator
  delegate_all

  def date_ago
    "#{h.time_ago_in_words(entry.created_at)} ago"
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

 def examination_type
  I18n.t(object.examination_type, scope: :examination_types)
 end
end
