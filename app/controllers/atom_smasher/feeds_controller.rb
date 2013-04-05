require_dependency "atom_smasher/application_controller"
require 'open-uri'

module AtomSmasher
  class FeedsController < ApplicationController
    def index
      @feeds = Feed.all
    end
    def show
      @feeds = Feed.all
      @feed = Feed.find(params[:id])
    end

    def new
      @feed = Feed.new
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @feed }
      end
    end

    def create
      @feed = Feed.new(params[:feed])
      respond_to do |format|
        if @feed.save
          format.html { redirect_to feeds_path, notice: 'Experiment was successfully created.' }
          format.json { render json: @feed, status: :created, location: @feed }
        else
          format.html { render action: "new" }
          format.json { render json: @feed.errors, status: :unprocessable_entity }
        end
      end
    end
  end
end