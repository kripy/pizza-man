require 'sinatra/base'
require 'mustache/sinatra'

class App < Sinatra::Base
  register Mustache::Sinatra
  require './views/layout'

  set :mustache, {
    :views     => './views/',
    :templates => './templates/'
  }

  configure do
    set :root, File.dirname(__FILE__)
  end

  helpers do

  end

  # Function allows both get / post.
  def self.get_or_post(path, opts={}, &block)
    get(path, opts, &block)
    post(path, opts, &block)
  end   

  get '/' do
    @page_title = 'Page Title'

    mustache :index
  end

end