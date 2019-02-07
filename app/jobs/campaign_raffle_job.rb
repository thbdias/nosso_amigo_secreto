class CampaignRaffleJob < ApplicationJob
  queue_as :emails

  def perform(campaign)
    results = RaffleService.new(campaign).call

    campaign.members.each {|m| m.set_pixel}

    results.each do |r|
      CampaignMailer.raffle(campaign, r.first, r.last).deliver_now # enviando email
    end

    campaign.update(status: :finished)

    # caso tenha problema durante a chamada do service ou envio do email
    # email ao dono da campanha dizendo
    # "olha, teve tais problemas...a gente não conseguiu processar...por favor volte ao site...faça novamente"
    # em vez do email pode usar notificação tbm
    #if results == false
      # Send mail to owner of campaign (desafio)
    #end
  end
end
