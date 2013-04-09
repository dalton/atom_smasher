require_dependency "atom_smasher/application_controller"
require 'open-uri'

module AtomSmasher
  class FeedsController < ApplicationController
    def index
      @feeds = current_reader.feeds.all
    end
    def show
      @feeds = current_reader.feeds.all
      @feed = current_reader.feeds.find(params[:id])
    end

    def new
      @feed = current_reader.feeds.build
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @feed }
      end
    end

    def create
      @feed = current_reader.feeds.build(params[:feed])
      respond_to do |format|
        if @feed.save
          current_reader.feeds << @feed
          format.html { redirect_to @feed, notice: 'Experiment was successfully created.' }
          format.json { render json: @feed, status: :created, location: @feed }
        else
          format.html { render action: "new" }
          format.json { render json: @feed.errors, status: :unprocessable_entity }
        end
      end
    end
  end
end