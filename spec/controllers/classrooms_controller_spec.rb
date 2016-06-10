require 'rails_helper'

RSpec.describe ClassroomsController, type: :controller do
  let (:classroom) { FactoryGirl.create(:classroom)}

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'sets classroom instance var' do
      classroom
      get :index
      expect(assigns[:classrooms]).to eq([classroom])
    end

    it 'renders index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, id: classroom.id
      expect(response).to have_http_status(:success)
    end

    it 'sets classroom instance var' do
      get :show, id: classroom.id
      expect(assigns[:classroom]).to eq(classroom)
    end

    it 'renders new template' do
      get :show, id: classroom.id
      expect(response).to render_template(:show)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it 'sets classroom instance var' do
      get :new
      @classroom = assigns[:classroom]
      expect(@classroom.id).to be_nil
      expect(@classroom.class).to eq(Classroom)
    end

    it 'renders new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, id: classroom.id
      expect(response).to have_http_status(:success)
    end

    it 'finds the right classroom' do
      get :edit, id: classroom.id
      expect(assigns[:classroom]).to eq(classroom)
    end

    it 'renders edit template' do
      get :edit, id: classroom.id
      expect(response).to render_template(:edit)
    end
  end

  describe "POST #create" do
    before(:each) do
      @classroom_params = {
        classroom: { name: 'Ruby on rais', code: 'ROR', active: true}
      }
    end

    it 'has http success' do
      post :create, @classroom_params
      expect(response).to have_http_status(302)
    end
  end

  describe "PUT #update" do
    it 'has http success' do
      put :update, { id: classroom.id, classroom: { name: 'Ruby on rails'} }

      expect(response).to have_http_status(302)
    end

    it 'deletes a classroom' do
      put :update, { id: classroom.id, classroom: { name: 'Ruby on rails', code: 'ROR', active: false } }
      expect(classroom.reload.active).to eq(false)
    end
  end

  describe "DELETE #destroy" do
    it 'has http success' do
      delete :destroy, id: classroom.id
      expect(response).to have_http_status(302)
    end

    it 'deletes a classroom' do
      delete :destroy, id: classroom.id
      expect(Classroom.count).to eq(0)
    end
  end
end











