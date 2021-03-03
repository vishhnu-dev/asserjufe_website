json.array!(@pre_reserva) do |pre_reserva|
  json.extract! pre_reserva, :nome_completo, :casa, :data_chegada, :data_saida, :email, :celular, :possui_dependetes, :dependetes, :possui_nao_dependentes, :nao_dependetes, :possui_criancas, :criancas
  json.url pre_reserva_url(pre_reserva, format: :json)
end
