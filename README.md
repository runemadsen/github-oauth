Installation
------------

To install the gem, simply run:

    gem install 'github-oauth'

Or the bundler equivalent:

    bundle install 'github-oauth'

Examples
--------

This shows you how to use the gem (here using sinatra routes).

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
    
The main route checks whether we have a token saved in the database. If not, it redirects to Github for the user to authorize the application.
The user is then returned to the /oauth path (specificed via the callback_url in the Github application settings), gets the token with the code parameter, and saves the token in a session variable.

If needed you can specify a specific scope for the authenticating user:

    redirect GithubOAuth.authorize_url('github_client_id', 'github_client_secret', 'gist')

I'm planning on releasing my GithubAPI gem that takes this token and makes read/write operations to the Github API super simple.