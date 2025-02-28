require 'sinatra'
require 'date'
require 'time'


listacnpjs = []

get '/api/empresas' do 
    if  listacnpjs.size == 0
        status 404 
    else
        "Empresas existente na base: #{listacnpjs} em #{Time.now}"
    end
end


get '/api/empresas/:cnpj' do |cnpj|
    cnpjEmpresar = params['cnpj']
    if listacnpjs.include?(cnpjEmpresar)
    " CNPJ: #{cnpjEmpresar} existente na base em #{Time.now}"
    else
        #NOT FOULD
      status 404
    end
end


post '/api/empresas/:cnpj' do |cnpj| 
    if (listacnpjs.include?(cnpj)) then
        status 409
    else
     "
      Incluindo Empresa  #{cnpj} em #{Time.now}
     "
     listacnpjs << cnpj
     response.headers['Location'] = "http://localhost:4567/empresas/#{cnpj}"
     status 201
    end
end


put '/api/empresas' do
    "
    Atualizando Trabalhador  em #{Time.now}

    "
end

delete '/api/empresas/:cnpj' do |cnpj|
    cnpjEmpresar = params['cnpj']
    if listacnpjs.include?(cnpj)
        listacnpjs.delete(cnpj)


    "
     Deletando Empresa com Cnpj: #{params['cnpj']} em #{Time.now}
    
    "
    else
    status 404
    end
end


# GET >  curl localhost:4567/api/empresas -i
# GET por CNPJ > curl localhost:4567/api/empresas/111 -i
# POST > curl localhost:4567/api/empresas/111 -i -X POST -d ' { } '
# DELETE > curl http://localhost:4567/api/empresas/111 -i -X DELETE

