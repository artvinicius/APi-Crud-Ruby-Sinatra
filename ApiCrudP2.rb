require 'sinatra'

get '/' do
    autor = " GET - Consultado " + params['autor']
end

post '/' do
    autor = " POST - Adicionando " + params['autor']
end

put '/' do
    autor = " PUT - Atualizando " + params['autor']
end

delete '/' do
    autor = " DELETE - Removendo" + params['autor']
end

# localhost:4567/?autor= Arthur