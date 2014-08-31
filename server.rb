#!/usr/bin/env ruby

require 'bundler/setup'
require 'sass'
require 'sinatra'

require 'autoprefixer-rails'

# Useful core extensions.
# require 'active_support'
# require 'active_support/core_ext'

# Additional time support.
# require 'time'


configure do
  set :application_title, 'sinatra-scaffold'
  set :assets_path,       "#{File.dirname(__FILE__)}/assets"
end

helpers do
end

# Routes
get '/' do
  erb :index
end

get '/stylesheets/:name' do
  # SECURE: Potentially dangerous filesystem access?
  filename = "#{settings.assets_path}/stylesheets/#{File.basename(params[:name])}"

  scss AutoprefixerRails.process(File.read(filename)).css
end
