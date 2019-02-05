FactoryGirl.define do
  factory :member do
    name         { FFaker::Lorem.word }
    email        { FFaker::Internet.email }
    campaign      # chama factory user para preencher esse campo
  end
end

# será chamado -> create(:member) 
# será chamado -> build(:member) 
# será chamado -> create(:member, campaign: @campaign)  -> em vez de gerar uma nova, substituir por uma conhecida
