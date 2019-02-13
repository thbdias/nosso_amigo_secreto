$(document).on 'turbolinks:load', ->            # Depois que a página carregar carregue este coffee
  $('.update_campaign input').bind 'blur', ->   # bluc -> evento, focus out (tira o foco) # qualquer input dentro do form (.update_campaign) estará sujeita ao 'bind'
    $('.update_campaign').submit()              # quando o campo perder o foco, este comando submete o formulário (.update_campaign)

  $('.update_campaign').on 'submit', (e) ->     # espera um evento submit do formulário (.update_campaign)
    $.ajax e.target.action,
        type: 'PUT' 
        dataType: 'json',
        data: $(".update_campaign").serialize() # pega todos os campos do formulário (.update_campaign) e serializa (coloca um do lado do outro)
        success: (data, text, jqXHR) ->
          Materialize.toast('Campanha atualizada', 4000, 'green')
        error: (jqXHR, textStatus, errorThrown) ->
          Materialize.toast('Problema na atualização da Campanha', 4000, 'red')
    return false                                # para o browser não submeter novamete o form ao se recarregar a página 

  $('.remove_campaign').on 'submit', (e) ->     # espera um evento submit do formulário (.remove_campaign)
    $.ajax e.target.action,                     # e -> próprio form       target -> form      action -> url do form
        type: 'DELETE'
        dataType: 'json',
        data: {}                                # só passa o id direto na url
        success: (data, text, jqXHR) ->
          $(location).attr('href','/campaigns');  # redireciona para a home / INCLUIR MODAL DE CONFIRMAÇÃO
        error: (jqXHR, textStatus, errorThrown) ->
          Materialize.toast('Problema na remoção da Campanha', 4000, 'red')
    return false                                # para o browser não submeter novamete o form ao se recarregar a página 

  $('.raffle_campaign').on 'submit', (e) ->     # espera um evento submit do formulário (.raffle_campaign)
    $.ajax e.target.action,                     # e -> próprio form       target -> form      action -> url do form
        type: 'POST'
        dataType: 'json',
        data: {}                                # só passa o id direto na url
        success: (data, text, jqXHR) ->
          Materialize.toast('Tudo certo, em breve os participantes receberão um email!', 4000, 'green')
        error: (jqXHR, textStatus, errorThrown) ->
          Materialize.toast(jqXHR.responseText, 4000, 'red')  # mostrando a mensagem que vem do backend
    return false                                # para o browser não submeter novamete o form ao se recarregar a página 