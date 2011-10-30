This is a simple gem that helps you authenticate via the Github API V3 using OAuth2
-----------------------------------------------------------------------------------

This is a simple example on how to use this gem (using sinatra routes). The gem will use the "callback_url" from your Github application OAuth settings (in this case I set it to http://mysite.com/oauth).

    # when user lands on home page
    get '/' do
      # check if we already have a token
      unless session[:access_token]
        # if not, redirect to the github authorication url
        redirect GithubOAuth.authorize_url('github_client_id', 'github_client_secret')
      end
      "You have authenticated"
    end

    # when the user comes back from the github authorization url
    get '/oauth' do
      # save the token in a session. append this token to all calls to the github api
      session[:access_token] = GithubOAuth.token('github_client_id', 'github_client_secret', params[:code])
      redirect '/'
    end

I'm planning on releasing my GithubAPI gem that takes this token and makes read/write operations to the Github API super simple.