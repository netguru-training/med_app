class EntriesDecorator < Draper::CollectionDecorator
  def for_examination(key)
    EntryDecorator.decorate_collection object.for_examination(key).last(2)
  end
end
