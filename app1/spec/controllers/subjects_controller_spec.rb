require 'rails_helper'

RSpec.describe SubjectsController, type: :controller do
  describe '#index' do
    it 'returns http success' do
      get :index
      expect(response.status).to eq 302
    end
  end

  describe '#new_subject' do
    it 'returns http success' do
      get :new_subject
      expect(response.status).to eq 302
    end
  end
  
  describe '#create_new_subject' do
    it 'returns http success' do
      get :create_new_subject
      expect(response.status).to eq 302
    end
  end

  describe '#new_task' do
    it 'returns http success' do
      get :new_task
      expect(response.status).to eq 302
    end
  end
  
  describe '#create_new_task' do
    it 'returns http success' do
      get :create_new_task
      expect(response.status).to eq 302
    end
  end
  
  describe '#prep_del_sub' do
    it 'returns http success' do
      get :prep_del_sub
      expect(response.status).to eq 302
    end
  end
  
  describe '#del_subject' do
    it 'returns http success' do
      get :del_subject
      expect(response.status).to eq 302
    end
  end
  
  describe '#prep_del_task' do
    it 'returns http success' do
      get :prep_del_task
      expect(response.status).to eq 302
    end
  end
  
  describe '#del_task' do
    it 'returns http success' do
      get :del_task
      expect(response.status).to eq 302
    end
  end
end
