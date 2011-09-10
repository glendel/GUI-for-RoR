# https://github.com/smartinez87/exception_notification/tree/2-3-stable
ExceptionNotification::Notifier.email_prefix = CONFIG['exception_notification']['email_prefix']
ExceptionNotification::Notifier.sender_address = CONFIG['exception_notification']['sender_address']
ExceptionNotification::Notifier.exception_recipients = CONFIG['exception_notification']['exception_recipients']