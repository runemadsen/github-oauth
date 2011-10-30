module GithubOAuth
  
  def self.github_client(client_id, client_secret)
    OAuth2::Client.new(client_id, client_secret, :authorize_url => 'https://github.com/login/oauth/authorize', :token_url => 'https://github.com/login/oauth/access_token')
  end
  
  def self.authorize_url(client_id, client_secret, scope = "repo,gist")
    self.github_client(client_id, client_secret).auth_code.authorize_url(:scope => scope)
  end
  
  def self.token(client_id, client_secret, code)
    self.github_client(client_id, client_secret).auth_code.get_token(code).token
  end
  
end