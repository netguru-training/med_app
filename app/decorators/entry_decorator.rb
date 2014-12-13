class EntryDecorator < Draper::Decorator
	delegate_all

	def examination_type_collection
    Entry.examination_types.map do |type, _|
      [I18n.t(type, scope: :examination_types), type]
    end
	end
end
