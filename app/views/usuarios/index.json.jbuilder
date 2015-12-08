json.array!(@usuarios) do |usuario|
  json.extract! usuario, :id, :usuario, :senha
  json.url usuario_url(usuario, format: :json)
end
