require 'rails_helper'

RSpec.describe Subject, type: :model do
  it 'create new sub' do
    before_count = Subject.count
    Subject.create(name: 'Элкек',kind: 'exam', user_id: '1')
    expect(Subject.count).to eq before_count
  end
  
  it 'find created sub' do
    Subject.create(name: 'Элкек',kind: 'exam', user_id: '1')
    expect(Subject.find_by(name: 'Элкек')).not_to be_present
  end

  it "create new sub with same number" do
    Subject.create(name: 'Элкек',kind: 'exam', user_id: '1')
    second_sub = Subject.create(name: 'Элкек',kind: 'exam', user_id: '1')
    expect(second_sub.errors[:value]).to eq []
  end
  
end
