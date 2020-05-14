# minha_app.rb
require 'sinatra'

get '/testecache' do
   
    # Specify response freshness policy for HTTP caches (Cache-Control header).
    #
    # See RFC 2616 / 14.9 for more on standard cache control directives:
    # http://tools.ietf.org/html/rfc2616#section-14.9.1
    cache_control :private, :max_age => 3600
    return "
    <html>
    	<body>
    	 <script>
    	 </script>
    	<p>Ola Mundo Louco 4!</p>
    	</body>
    </html>
    "
end