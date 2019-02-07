require 'rails_helper'

describe RaffleService do

  before :each do
    @campaign = create(:campaign, status: :pending)
  end

  describe '#call' do
    context "when has more then two members" do
      before(:each) do
        # 4 membros pq o criador da campanha tbm é membro
        create(:member, campaign: @campaign)
        create(:member, campaign: @campaign)
        create(:member, campaign: @campaign)
        @campaign.reload

        @results = RaffleService.new(@campaign).call
      end

      it "results is a hash" do
        expect(@results.class).to eq(Hash)
      end

      # {x => y, y => h, ...} member => amigo
      
      it "all members are in results as a member" do
        result_members = @results.map {|r| r.first} # [x, y]
        expect(result_members.sort).to eq(@campaign.members.sort)
      end

      it "all member are in results as a friend" do
        result_friends = @results.map {|r| r.last} # [y, h]
        expect(result_friends.sort).to eq(@campaign.members.sort)
      end

      it "a member don't get yourself" do
        @results.each do |r|
          expect(r.first).not_to eq(r.last)
        end
      end

      it "a member x don't get a member y that get the member x" do
        # Desafio
        @results.each do |r|                              
          @results.each do |k|
            if (r.first == k.last) 
              expect(r.last).not_to eq(k.first)
            end
          end
        end 
      end

    end

    context "when don't has more then two members" do
      before(:each) do
        create(:member, campaign: @campaign)
        @campaign.reload

        @response = RaffleService.new(@campaign).call
      end

      it "return false" do
        expect(@response).to eql(false)
      end
    end
  end
end