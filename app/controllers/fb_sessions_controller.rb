class FbSessionsController < ApplicationController
  require 'faker'
  def new_fb_session
    client = HTTPClient.new
    @appid='582845488404281'
    @appsec='421d10d0271b4a046f997e376e11fa9b'
    @permissions= 'email,publish_actions'
    @uri='http://zwvr.t.proxylocal.com/fb_login'
    
    if (!params[:code])
      redirect_to "https://www.facebook.com/dialog/oauth?client_id=#{@appid}&redirect_uri=#{@uri}&scope=#{@permissions}"
    else 
      @url= "https://graph.facebook.com/oauth/access_token?client_id=#{@appid}&redirect_uri=#{@uri}&client_secret=#{@appsec}&code=#{params[:code]}"
      access_token=client.get_content(@url).scan(/([^&]*)&/).last.first
      @url= "https://graph.facebook.com/me?"+access_token+"&fields=username,email,name,picture"
      data = ActiveSupport::JSON.decode(client.get_content(@url))
      email=data["email"]
      p '$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$'
      p access_token
      #@user = User.find(:all, :conditions=>["username LIKE ?",email], :limit=>"1")
      @user = User.where(username: email)
       if @user
          if @user.fbid!=data["username"]
            @user.fbid=data["username"]
          @user_session = UserSession.create(@user)
          @user_session.save
          #@fbuser = Fbuser.find_by
          redirect_to users_path
       else
          #password = Faker::Base.regexify('/^([0-9][A-Z][a-z]){2}$/')
          password = 'abcd'
          @newuser=User.create(:username=>email, :name=>data["name"], :password=>password, :password_confirmation=>password, :fbid=>data["username"])
          @user_session = UserSession.create(@newuser)
          @user_session.save
          redirect_to @newuser
      end
    end
  end
end