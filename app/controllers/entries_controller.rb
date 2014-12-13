class EntriesController < ApplicationController

	expose_decorated(:entry)

	def index
	end

	def show
	end

	def new
	end

  def create
    self.entry = Entry.new(entry_params)
    entry.user_id = current_user.id

    if entry.save
      redirect_to entry_path(entry), notice: 'Entry was successfully created.'
    else
      render 'new'
    end
  end

  def entry_params
    params.require(:entry).permit(:date, :examination_type, :value, :description)
  end
end
