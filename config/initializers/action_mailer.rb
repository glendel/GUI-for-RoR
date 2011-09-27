# http://guides.rubyonrails.org/v2.3.11/action_mailer_basics.html
CONFIG['action_mailer']['delivery_method'] = CONFIG['action_mailer']['delivery_method'].to_sym
CONFIG['action_mailer']['smtp_settings']['authentication'] = CONFIG['action_mailer']['smtp_settings']['authentication'].to_sym

ActionMailer::Base.raise_delivery_errors = CONFIG['action_mailer']['raise_delivery_errors']
ActionMailer::Base.delivery_method = CONFIG['action_mailer']['delivery_method']
ActionMailer::Base.smtp_settings = CONFIG['action_mailer']['smtp_settings']
ActionMailer::Base.default_url_options = CONFIG['action_mailer']['default_url_options'].symbolize_keys