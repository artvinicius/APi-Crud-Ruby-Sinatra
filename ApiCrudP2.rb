require 'sinatra'
require 'date'


get '/empresa:cnpj' do |cnpj|
    "
     <p>Consultando CNPJ: #{cnpj} em #{Date.today}</p>
    "
end

post '/empresa' do 
    "
     <p>Inserindo Empresa em #{Date.today}</p>
    
    "
end

put '/empresa:cnpj' do 
    "
     <p>Atualizando Empresa em #{Date.today}</p>
    
    "
end

delete '/empresa:cnpj' do 
    "
     <p>Deletando Empresa em #{Date.today}</p>
    
    "
end

#curl http://localhost:4567/empresa:1
#curl http://localhost:4567/empresa:1 -i -X POST -d '  '
#curl http://localhost:4567/empresa:1 -i -X PUT -d '  '
#curl http://localhost:4567/empresa:1 -X DELETE
