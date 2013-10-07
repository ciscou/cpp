# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
Cpp::Application.config.secret_token = ENV['SECRET_TOKEN'].presence || '3d1fadf40f8e37c12f9e13408eca085296d704c7d231a929d112a5af1ebfe552567230be9925b3d5dc41c66cfb6b0c0949cb91aa02f89a5020947c58dd7b1684'
