FactoryGirl.define do
  factory :campaign do
    title         { FFaker::Lorem.word }
    description   { FFaker::Lorem.sentence }
    user          # chama factory user para preencher esse campo
  end
end

# será chamado -> create(:campaign)