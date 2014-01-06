# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.

def secure_token
	token_file = Rails.root.join('.secret')
	if File.exist?(token_file)
		File.read(token_file).chomp
	else

		token = SecureRandom.hex(64)
		File.write(token_file, token)
		token
	end


end


#SampleApp::Application.config.secret_key_base = '7fff2f1aa1b4c2cc9923fcfb4ffff522255772ff16b636dc5e819c1f6caafb1023af315ceefe29567b14a88e850c7925f7a81d0206ef448488326f130775d038'

SampleApp::Application.config.secret_key_base = secure_token
