ActionMailer::Base.smtp_settings = {
	address: ENV['SMTP_ADDRESS'],
	port: 587,
	domain: ENV['SMTP_DOMAIN'],
	authentication: 'plain',
	user_name: ENV['SMTP_USER'],
	password: ENV['SMTP_PASS'],
	enable_starttls_auto: true
}
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.raise_delivery_errors = true

