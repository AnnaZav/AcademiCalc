require 'rails_helper'

RSpec.describe Task, type: :model do
  it 'create new task' do
    before_count = Task.count
    Task.create(name: 'Rk',max: '30', current: '30', subject_id: '1')
    expect(Task.count).to eq before_count
  end
  
  it 'find created sub' do
    Task.create(name: 'Rk',max: '30', current: '30', subject_id: '1')
    expect(Task.find_by(name: 'Rk')).not_to be_present
  end

  it "create new sub with same number" do
    Task.create(name: 'Rk',max: '30', current: '30', subject_id: '1')
    second_sub = Task.create(name: 'Rk',max: '30', current: '30', subject_id: '1')
    expect(second_sub.errors[:value]).to eq []
  end
  
end
