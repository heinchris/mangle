require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by the Rails when you ran the scaffold generator.

describe IterationsController do

  def mock_iteration(stubs={})
    @mock_iteration ||= mock_model(Iteration, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all iterations as @iterations" do
      Iteration.stub(:all) { [mock_iteration] }
      get :index
      assigns(:iterations).should eq([mock_iteration])
    end
  end

  describe "GET show" do
    it "assigns the requested iteration as @iteration" do
      Iteration.stub(:find).with("37") { mock_iteration }
      get :show, :id => "37"
      assigns(:iteration).should be(mock_iteration)
    end
  end

  describe "GET new" do
    it "assigns a new iteration as @iteration" do
      Iteration.stub(:new) { mock_iteration }
      get :new
      assigns(:iteration).should be(mock_iteration)
    end
  end

  describe "GET edit" do
    it "assigns the requested iteration as @iteration" do
      Iteration.stub(:find).with("37") { mock_iteration }
      get :edit, :id => "37"
      assigns(:iteration).should be(mock_iteration)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "assigns a newly created iteration as @iteration" do
        Iteration.stub(:new).with({'these' => 'params'}) { mock_iteration(:save => true) }
        post :create, :iteration => {'these' => 'params'}
        assigns(:iteration).should be(mock_iteration)
      end

      it "redirects to the created iteration" do
        Iteration.stub(:new) { mock_iteration(:save => true) }
        post :create, :iteration => {}
        response.should redirect_to(iteration_url(mock_iteration))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved iteration as @iteration" do
        Iteration.stub(:new).with({'these' => 'params'}) { mock_iteration(:save => false) }
        post :create, :iteration => {'these' => 'params'}
        assigns(:iteration).should be(mock_iteration)
      end

      it "re-renders the 'new' template" do
        Iteration.stub(:new) { mock_iteration(:save => false) }
        post :create, :iteration => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested iteration" do
        Iteration.stub(:find).with("37") { mock_iteration }
        mock_iteration.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :iteration => {'these' => 'params'}
      end

      it "assigns the requested iteration as @iteration" do
        Iteration.stub(:find) { mock_iteration(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:iteration).should be(mock_iteration)
      end

      it "redirects to the iteration" do
        Iteration.stub(:find) { mock_iteration(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(iteration_url(mock_iteration))
      end
    end

    describe "with invalid params" do
      it "assigns the iteration as @iteration" do
        Iteration.stub(:find) { mock_iteration(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:iteration).should be(mock_iteration)
      end

      it "re-renders the 'edit' template" do
        Iteration.stub(:find) { mock_iteration(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested iteration" do
      Iteration.stub(:find).with("37") { mock_iteration }
      mock_iteration.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the iterations list" do
      Iteration.stub(:find) { mock_iteration }
      delete :destroy, :id => "1"
      response.should redirect_to(iterations_url)
    end
  end

end
