# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# rake secret to make a new token
AnimeErikkatCom::Application.config.secret_token = ENV['SECRET_TOKEN'] || '4eb201f59c119b0dd3092f10f104f141d22e8ba8d42277c8a8c23f27c8d9e26f43c7b61d2bc82273976a598f7376a3038712d219d2b8b8f99fdc63f09c3c974c'
