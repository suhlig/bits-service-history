#!/usr/bin/env ruby

require 'open-uri'
require 'pathname'
require 'octokit'

def download(url, path)
  warn "Saving #{url} to #{path}"
  File.open(path, "wb") do |f|
    IO.copy_stream(open(url), f)
  end
end

Octokit.configure do |c|
  c.access_token = ENV.fetch('GITHUB_TOKEN')
end

github = Octokit::Client.new

contributors = %w(bits-service bits-service-release bits-service-ci bits-service-client).map do |project|
  github.contributors("cloudfoundry-incubator/#{project}", true).map(&:login)
end.flatten.uniq.compact

avatars = Pathname(__dir__) / 'avatars'
avatars.mkpath

contributors.each do |contributor|
  user = github.user(contributor)
  name = user.name || contributor
  download(user.avatar_url, (avatars / name).sub_ext('.png'))
end
