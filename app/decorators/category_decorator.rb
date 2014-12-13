class CategoryDecorator < Draper::Decorator
  # def examination_type_collection
  #   Entry.examination_types.map do |type, _|
  #     [I18n.t(type, scope: :examination_types), type]
  #   end
  # end
  def name
    I18n.t(object, scope: :examination_types)
  end

  def key
    object
  end
end
