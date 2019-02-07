class Member < ApplicationRecord
  belongs_to :campaign
  after_save :set_campaign_pending
  validates :name, :email, :campaign, presence: true

  def set_pixel
    self.open = false # cara viu/não viu, msg no email
    
    # token é uma url aleatória
    # quando o member abrir a url aleatória com o token, o backend deve reconhecer
    # a qual member pertence o devido token aleatória.
    # ao identificar o member correspondente ao token inserido na url aletória,
    # o backend seta o atributo open como true, ou seja, como visualizado.
    # loop -> loop infinito até encontrar um 'break';
    self.token = loop do
      # gera um token aleatório
      random_token = SecureRandom.urlsafe_base64(nil, false) 
      # pare e retorne 'random_token' a menos que já exita um membro com o token.
      break random_token unless Member.exists?(token: random_token)
      # break random_token if not Member.exists?(token: random_token)
    end
    self.save!
  end

  protected

  def set_campaign_pending
    self.campaign.update(status: :pending)
  end
end
