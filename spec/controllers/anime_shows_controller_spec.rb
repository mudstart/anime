require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe AnimeShowsController do

  # This should return the minimal set of attributes required to create a valid
  # AnimeShow. As you add validations to AnimeShow, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { :name => 'Simple Show', :url => 'www.nwanime.com' }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # AnimeShowsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all anime_shows as @anime_shows" do
      anime_show = AnimeShow.create! valid_attributes
      get :index, {}, valid_session
      assigns(:anime_shows).should eq([anime_show])
    end
  end

  describe "GET show" do
    it "assigns the requested anime_show as @anime_show" do
      anime_show = AnimeShow.create! valid_attributes
      get :show, {:id => anime_show.to_param}, valid_session
      assigns(:anime_show).should eq(anime_show)
    end
  end

  describe "GET new" do
    it "assigns a new anime_show as @anime_show" do
      user = create_user
      sign_in user
      get :new, {}, valid_session
      assigns(:anime_show).should be_a_new(AnimeShow)
    end
  end

  describe "GET edit" do
    it "assigns the requested anime_show as @anime_show" do
      user = create_user
      sign_in user
      anime_show = AnimeShow.create! valid_attributes
      get :edit, {:id => anime_show.id}, valid_session
      assigns(:anime_show).should eq(anime_show)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new AnimeShow" do
        expect {
          post :create, {:anime_show => valid_attributes}, valid_session
        }.to change(AnimeShow, :count).by(1)
      end

      it "assigns a newly created anime_show as @anime_show" do
        post :create, {:anime_show => valid_attributes}, valid_session
        assigns(:anime_show).should be_a(AnimeShow)
        assigns(:anime_show).should be_persisted
      end

      it "redirects to the created anime_show" do
        post :create, {:anime_show => valid_attributes}, valid_session
        response.should redirect_to(AnimeShow.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved anime_show as @anime_show" do
        # Trigger the behavior that occurs when invalid params are submitted
        AnimeShow.any_instance.stub(:save).and_return(false)
        post :create, {:anime_show => {  }}, valid_session
        assigns(:anime_show).should be_a_new(AnimeShow)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        AnimeShow.any_instance.stub(:save).and_return(false)
        post :create, {:anime_show => {  }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested anime_show" do
        anime_show = AnimeShow.create! valid_attributes
        # Assuming there are no other anime_shows in the database, this
        # specifies that the AnimeShow created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        AnimeShow.any_instance.should_receive(:update_attributes).with({ "these" => "params" })
        put :update, {:id => anime_show.to_param, :anime_show => { "these" => "params" }}, valid_session
      end

      it "assigns the requested anime_show as @anime_show" do
        anime_show = AnimeShow.create! valid_attributes
        put :update, {:id => anime_show.to_param, :anime_show => valid_attributes}, valid_session
        assigns(:anime_show).should eq(anime_show)
      end

      it "redirects to the anime_show" do
        anime_show = AnimeShow.create! valid_attributes
        put :update, {:id => anime_show.to_param, :anime_show => valid_attributes}, valid_session
        response.should redirect_to(anime_show)
      end
    end

    describe "with invalid params" do
      it "assigns the anime_show as @anime_show" do
        anime_show = AnimeShow.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        AnimeShow.any_instance.stub(:save).and_return(false)
        put :update, {:id => anime_show.to_param, :anime_show => {  }}, valid_session
        assigns(:anime_show).should eq(anime_show)
      end

      it "re-renders the 'edit' template" do
        anime_show = AnimeShow.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        AnimeShow.any_instance.stub(:save).and_return(false)
        put :update, {:id => anime_show.to_param, :anime_show => {  }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested anime_show" do
      anime_show = AnimeShow.create! valid_attributes
      expect {
        delete :destroy, {:id => anime_show.to_param}, valid_session
      }.to change(AnimeShow, :count).by(-1)
    end

    it "redirects to the anime_shows list" do
      anime_show = AnimeShow.create! valid_attributes
      delete :destroy, {:id => anime_show.to_param}, valid_session
      response.should redirect_to(anime_shows_url)
    end
  end

end
