class RaffleService
    def initialize(campaign)
      @campaign = campaign
    end
  
    def call
      # pelo menos 3 membros  
      return false if @campaign.members.count < 3
  
      results = {}
      members_list = @campaign.members
      friends_list = @campaign.members

      i = 0
      while(members_list.count != i)
        m = members_list[i]
        i += 1
  
        loop do
          friend = friends_list.sample # friend aleatório
  
          # a => b, b => c, c => a, f => f
          # recomeçar o sorteio
          if friends_list.count == 1 and friend == m
            results = {}
            members_list = @campaign.members
            friends_list = @campaign.members
            i = 0
            break
          elsif friend != m and results[friend] != m # garante que A não tenha tirado A
            results[m] = friend
            friends_list -= [friend]
            break
          end
        end # fim loop

      end # fim while

      results
    end # fim call
  end # fim class