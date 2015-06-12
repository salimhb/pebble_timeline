module PebbleTimeline
  class Pins
    def initialize(master, scope = 'shared', user_token = nil)
      @master = master
      @scope = scope
      @user_token = user_token if @scope == 'user'
    end

    def create(params = {})
      params.merge!(user_token: @user_token) if @user_token
      @master.call("#{@scope}/pins/#{params[:id]}", :put, params)
    end

    def update(id, params = {})
      params.merge!(user_token: @user_token) if @user_token
      @master.call("#{@scope}/pins/#{id}.json", :put, params)
    end

    def delete(id, params = {})
      params.merge!(user_token: @user_token) if @user_token
      @master.call("#{@scope}/pins/#{id}", :delete, params)
    end
  end
end
