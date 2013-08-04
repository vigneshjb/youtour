class FbSessionsController < ApplicationController
  def new_fb_session
    client = HTTPClient.new
    @appid='582845488404281'
    @appsec='421d10d0271b4a046f997e376e11fa9b'
    @uri='http://9jbf.t.proxylocal.com/fb_login'
    
    if (!params[:code])
      redirect_to "https://www.facebook.com/dialog/oauth?client_id=#{@appid}&redirect_uri=#{@uri}&scope=email,user_likes,publish_actions,friends_about_me"
    else 
      @url= "https://graph.facebook.com/oauth/access_token?client_id=#{@appid}&redirect_uri=#{@uri}&client_secret=#{@appsec}&code=#{params[:code]}"
      result = client.get_content(@url)
      access_token=result.scan(/([^&]*)&/).last.first
      @url= "https://graph.facebook.com/me?"+access_token+"&fields=username,email"
      result = client.get_content(@url)
      data = ActiveSupport::JSON.decode(result)
      email=data["email"]
      @user = User.find(:all, :conditions=>["username LIKE ?",email])
       if @user
          @user_session = UserSession.create(@user.first,true)
          @user_session.save
          redirect_to users_path
       else
          redirect_to home_path
      end
    end
  end
end