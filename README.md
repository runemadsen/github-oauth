Installation
------------

To install the gem, simply run:

    gem install 'github-oauth'

Or the bundler equivalent:

    bundle install 'github-oauth'

Examples
--------

This is a simple example on how to use the gem (here using sinatra routes). The gem will use the "callback_url" from your Github application OAuth settings (in this case I set it to http://mysite.com/oauth).

    require 'github-oauth'    

    get '/' do
      unless session[:access_token]
        redirect GithubOAuth.authorize_url('github_client_id', 'github_client_secret')
      end
      "You have authenticated"
    end

    get '/oauth' do
      session[:access_token] = GithubOAuth.token('github_client_id', 'github_client_secret', params[:code])
      redirect '/'
    end

You can specify the specific scope for the authenticating user:

    redirect GithubOAuth.authorize_url('github_client_id', 'github_client_secret', 'gist')

I'm planning on releasing my GithubAPI gem that takes this token and makes read/write operations to the Github API super simple.