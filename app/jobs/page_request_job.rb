require 'http'
class PageRequestJob < ApplicationJob
  queue_as :default

  def perform(url, id)
    html = HTTP.get(url).to_s
    File.open(Rails.root.join('public', 'uploads', "#{id}.txt"), 'w') {|f| f.write(html) }
    Job.find(id).update_attributes(:completed => true)
  end
end
