FactoryGirl.define do
  factory :campaign do
    title         { FFaker::Lorem.word }
    description   { FFaker::Lorem.sentence }
    user          # chama factory user para preencher esse campo

    status        { :pending }
    location      { "#{FFaker::Address.city}, #{FFaker::Address.street_address}" }
    event_date    { FFaker::Time.date } # DateTime.now.hour.to_s -> pega hora local
    event_hour    { rand(24).to_s }
  end
end

# será chamado -> create(:campaign)