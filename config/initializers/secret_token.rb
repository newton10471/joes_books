# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# JoesBooks::Application.config.secret_token = '424b1eb8ec3bd533be16785fde08f608b3d3327159fa2ddad28666994be3f626df69e89b05013ca5d31b60c83dd95b943f78b40359935504adcb687adbea081d'

require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
  # Use the existing token.
    File.read(token_file).chomp
  else
    # Generate a new token and store it in token_file.
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end

JoesBooks::Application.config.secret_key_base = secure_token

