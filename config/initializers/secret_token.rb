# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
#Dins::Application.config.secret_key_base = 'f60efcb29cf1c16560581701de0e2420de2c2e8b782553b34d23359a827121cb2857ddfa6cc7195152171f3bfa041428f6b8d0a143f5f0e069a5959fb05e01e4'

require 'securerandom'

def secure_token
	token_file = Rails.root.join('.secret')
	if File.exist?(token_file)
		# Use the existing token
		File.read(token_file).chomp
	else
		# Generating a new token and store it in token_file.
		token = SecureRandom.hex(64)
		File.write(token_file, token)
		token
	end
end

Dins::Application.config.secret_key_base = secure_token