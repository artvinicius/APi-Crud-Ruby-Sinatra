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


put '/api/empresas/:cnpj' do |cnpj|
    if (cnpj.include?(cnpj) then
        status 404
    else
        "
        Cnpj Atualizado #{cnpj} em #{Time.now}
        "
        listacnpjs << cnpj
        status 200
    end
end


    # "
    #  Atualizando Trabalhador  em #{Time.now}
    
    # "
end

delete '/api/empresas/:cnpj' do 
    if listacnpjs.include?(cnpjEmpresar) then listacnpjs.delete;  
    "
     Deletando Empresa  em #{Time.now}
    
    "
end

# GET >  curl localhost:4567/api/empresas -i
# GET por CNPJ > curl localhost:4567/api/empresas/111 -i
# POST > curl localhost:4567/api/empresas/111 -i -X POST -d ' { } '
# DELETE > curl http://localhost:4567/api/empresas/123456789101 -i -X DELETE
