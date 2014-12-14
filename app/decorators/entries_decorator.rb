class EntriesDecorator < Draper::CollectionDecorator
      delegate :current_page, :total_pages, :limit_value

  def for_examination(key)
    EntryDecorator.decorate_collection object.for_examination(key).last(2)
  end
end
