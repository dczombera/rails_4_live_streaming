require 'reloader/sse'

class BrowserController < ApplicationController
  include ActionController::Live

  def index
    # SSE expects the `text/event-stream` content type
    response.headers['Content-Type'] = 'text/event-stream'

    sse = Reloader::SSE.new(response.stream)

    begin
		directory = File.join(Rails.root, 'app', 'assets', 'stylesheets', 'users.css.scss')
		
		notifier = INotify::Notifier.new

		# Watch the above directories
		notifier.watch(directory,:modify) do |dir|
		# Send a message on the "open" steam on every change 
			sse.write({ dir: dir }, :event => 'refresh')
		end
		notifier.run

    rescue IOError
      # Some exception handler code
    ensure
      sse.close
    end
  end
end