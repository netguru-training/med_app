class EntryDecorator < Draper::Decorator
	delegate_all

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

end
