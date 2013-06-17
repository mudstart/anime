class SubscriptionsController < ApplicationController
  before_filter :check_if_confirmed

  # GET /subscriptions
  # GET /subscriptions.json
  def index
    @subscriptions = current_user.shows_subscribed_to

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @subscriptions }
    end
  end

  # GET /subscriptions/new
  # GET /subscriptions/new.json
  def new
    @subscription = Subscription.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @subscription }
    end
  end

  # POST /subscriptions
  # POST /subscriptions.json
  def create
    @anime_show = AnimeShow.find(params[:anime_show_id])
    @subscription = current_user.subscribe_to_show(@anime_show)

    respond_to do |format|
      if @subscription.save
        format.html { redirect_to :back, :notice => 'Subscription was successfully created.' }
        format.json { render :json => @subscription, :status => :created, :location => @subscription }
      else
        format.html { render :action => "new" }
        format.json { render :json => @subscription.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /subscriptions/1
  # DELETE /subscriptions/1.json
  def destroy
    @subscription = current_user.subscriptions.find_by_anime_show_id(params[:id])
    @subscription.destroy

    respond_to do |format|
      format.html { redirect_to subscriptions_url }
      format.json { head :no_content }
    end
  end
end
