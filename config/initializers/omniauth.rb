Rails.application.config.middleware.use OmniAuth::Builder do
provider :facebook, '509651209166926', '507783c3478513af73c4404ea2a38538',
    :scope => 'user_about_me'

    OmniAuth.config.on_failure = SignupController.action(:failure)
end