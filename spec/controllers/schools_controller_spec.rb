require 'rails_helper'

RSpec.describe SchoolsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'sets the schools instance variable' do
      get :index
      expect(assigns(:schools)).to eq([])
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end

    it 'has schools in the schools instance variable' do
      3.times {|index| School.create(name: "name_#{index}", year_built: '1996', rating: 8)}
      get :index
      expect(assigns(:schools).length).to eq(3)
      expect(assigns(:schools).last.name).to eq('name_2')
    end
  end

  describe "GET #show" do
    it "returns http success" do
      school = School.create(name: 'name', year_built: '1996', rating: 8)
      get :show, id: school.id
      expect(response).to have_http_status(:success)
    end

    it 'renders the show template' do
      school = School.create(name: 'name', year_built: '1996', rating: 8)
      get :show, id: school.id
      expect(response).to render_template(:show)
    end

    it 'sets the school instance variable' do
      school = School.create(name: 'name', year_built: '1996', rating: 8)
      get :show, id: school.id
      expect(assigns(:school).name).to eq(school.name)
    end
  end


  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it 'renders the template' do
       get :new
      expect(response).to render_template(:new)
    end

    it 'sets the school instance variable' do
      get :new
      expect(assigns(:school)).to_not eq(nil)
    end
  end

   describe 'POST #create' do
    it 'sets the school instance variable' do
      school_params = {school: 
                         {
                          name: 'test school', 
                          year_built: '1990', 
                          rating: 5
                         }
                       }
      post :create, school_params
      expect(assigns(:school)).to_not eq(nil)
      expect(assigns(:school).name).to eq(school_params[:school][:name])
    end

    it 'creates a new school' do
      school_params = {school: 
                         {
                          name: 'test school', 
                          year_built: '1990', 
                          rating: 5
                         }
                       }
      expect(School.count).to eq(0)
      post :create, school_params
      expect(School.count).to eq(1)
      expect(School.first.name).to eq(school_params[:school][:name])
    end

    it 'redirects to the show page on success' do
      school_params = {school: 
                         {
                          name: 'test school', 
                          year_built: '1990', 
                          rating: 5
                         }
                       }
      post :create, school_params
      expect(response).to redirect_to(school_path(School.first))
    end

    it 'renders the new template on fail' do
      school_params = {school: 
                         {
                          name: '', 
                          year_built: '1990', 
                          rating: 5
                         }
                       }
      post :create, school_params
      expect(School.count).to eq(0)
      expect(response).to render_template(:new)
    end

    it 'sets the flash sucesss on successful create' do
     school_params = {school: 
                         {
                          name: 'test school', 
                          year_built: '1990', 
                          rating: 5
                         }
                       }
      post :create, school_params
      expect(flash[:success]).to eq('School Created!')
    end

  end

  describe "GET #edit" do
    it "returns http success" do
      school = School.create(name: 'name', year_built: '1990', rating: 8)
      get :edit, id: school.id
      expect(response).to have_http_status(:success)
    end

    it 'renders edit template' do
      school = School.create(name: 'name', year_built: '1990', rating: 8)
      get :edit, id: school.id
      expect(response).to render_template(:edit)
    end

    it 'sets school instance variable' do
      school = School.create(name: 'name', year_built: '1990', rating: 8)
      get :edit, id: school.id
      expect(assigns(:school).id).to eq(school.id)
    end
  end

  describe 'PUT #update' do
    it 'sets the school instance variable' do
      school = School.create(name: 'name', year_built: '1990', rating: 8)
    end

    it 'updates the school' do
      school = School.create(name: 'name', year_built: '1990', rating: 8)
      put :update, {id: school.id, school: {name: 'new name'}}
      # we need to reload because the school variable is stale
      # reload grabs the most recent attributes out of the data base
      expect(school.reload.name).to eq('new name')
    end

    it 'redirects to the show on success' do
      school = School.create(name: 'name', year_built: '1990', rating: 8)
    end

    it 'renders the edit template on fail' do
      school = School.create(name: 'name', year_built: '1990', rating: 8)
    end

    it 'sets the flash success on update' do
      school = School.create(name: 'name', year_built: '1990', rating: 8)
    end
  end

  describe 'DELETE #destroy' do
    it 'sets the school instance variable' do
      school = School.create(name: 'name', year_built: '1990', rating: 8)
      delete :destroy, id: school.id
      expect(assigns(:school)).to eq(school)
    end

    it 'destroys the school sucessfully' do
      school = School.create(name: 'name', year_built: '1990', rating: 8)
      expect(School.count).to eq(1)
      delete :destroy, id: school.id
      expect(School.count).to eq(0)
    end

    it 'sets the flash success message' do
      school = School.create(name: 'name', year_built: '1990', rating: 8)
      delete :destroy, id: school.id
      expect(flash[:success]).to eq('School Deleted!')
    end

    it 'redirects to the index path after destroy' do
      school = School.create(name: 'name', year_built: '1990', rating: 8)
      delete :destroy, id: school.id
      expect(response).to redirect_to(schools_path)
    end
  end
end
