module TestHelper
    def log_in_as(user, password: 'password')
        post login_path, params: { session: { email: user.email,
                                              password: password
                                            } }
    end

    def admin_login
        #user = FactoryBot.create(:admin)

        visit root_path
        fill_in 'Email', with: 'mori@mori.com', match: :first
        fill_in 'Password', with: 'morimori', match: :first
        click_button 'Log in'

    end

    def current_user
        if session[:user_id]
          @current_user ||= User.find_by(id: session[:user_id])
        end
    end

    def log_in(user)
        session[:user_id] = user.id
        session[:name] = user.name
    end

    def correct_user
        @user = User.find(params[:id])
        redirect_to(root_url) unless @user == current_user
      end
end
