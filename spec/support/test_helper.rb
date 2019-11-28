module TestHelper
    def log_in_as(user, password: 'password')
        post login_path, params: { session: { email: user.email,
                                              password: password
                                            } }
    end
end
