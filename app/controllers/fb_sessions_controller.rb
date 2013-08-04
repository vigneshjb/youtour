class FbSessionsController < ApplicationController
  require 'faker'
  def new_fb_session
    client = HTTPClient.new
    @appid='582845488404281'
    @appsec='421d10d0271b4a046f997e376e11fa9b'
    @uri='http://6bv0.t.proxylocal.com/fb_login'
    
    if (!params[:code])
      redirect_to "https://www.facebook.com/dialog/oauth?client_id=#{@appid}&redirect_uri=#{@uri}&scope=email,user_likes,publish_actions,friends_about_me"
    else 
      @url= "https://graph.facebook.com/oauth/access_token?client_id=#{@appid}&redirect_uri=#{@uri}&client_secret=#{@appsec}&code=#{params[:code]}"
      result = client.get_content(@url)
      access_token=result.scan(/([^&]*)&/).last.first
      @url= "https://graph.facebook.com/me?"+access_token+"&fields=username,email,name"
      result = client.get_content(@url)
      data = ActiveSupport::JSON.decode(result)
      email=data["email"]
      @user = User.find(:all, :conditions=>["username LIKE ?",email], :limit=>"1")
       if @user.first
          @user_session = UserSession.create(@user.first)
          @user_session.save
          redirect_to users_path
       else
          password = Faker::Base.regexify('/^([0-9][A-Z][a-z]){2}$/')
          @newuser=User.create(:username=>email, :name=>data["name"], :password=>password, :password_confirmation=>password, :fbid=>data["username"])
          #notify password to user and make him change it !!
          @user_session = UserSession.create(@newuser)
          @user_session.save
          redirect_to @newuser
      end
    end
  end
end