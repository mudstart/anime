class AnimeShowsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]

  # GET /anime_shows
  # GET /anime_shows.json
  def index
    @anime_shows = AnimeShow.order('created_at DESC')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @anime_shows }
    end
  end

  # GET /anime_shows/1
  # GET /anime_shows/1.json
  def show
    @anime_show = AnimeShow.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @anime_show }
    end
  end

  # GET /anime_shows/new
  # GET /anime_shows/new.json
  def new
    @anime_show = AnimeShow.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @anime_show }
    end
  end

  # GET /anime_shows/1/edit
  def edit
    @anime_show = AnimeShow.find(params[:id])
  end

  # POST /anime_shows
  # POST /anime_shows.json
  def create
    @anime_show = Scrape.show(params[:anime_show][:url])

    respond_to do |format|
      if @anime_show.persisted?
        format.html { redirect_to @anime_show, :notice => 'Anime show was successfully created.' }
        format.json { render :json => @anime_show, :status => :created, :location => @anime_show }
      else
        format.html { render :action => "new" }
        format.json { render :json => @anime_show.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /anime_shows/1
  # PUT /anime_shows/1.json
  def update
    @anime_show = AnimeShow.find(params[:id])
    Scrape.update_show(@anime_show)

    respond_to do |format|
      if @anime_show.update_attributes(params[:anime_show])
        format.html { redirect_to @anime_show, :notice => 'Anime show was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { redirect_to @anime_show }
        format.json { render :json => @anime_show.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /anime_shows/1
  # DELETE /anime_shows/1.json
  def destroy
    @anime_show = AnimeShow.find(params[:id])
    @anime_show.destroy

    respond_to do |format|
      format.html { redirect_to anime_shows_url }
      format.json { head :no_content }
    end
  end
end
