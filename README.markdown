# History of the bits-service

Idea: Use [gource](https://github.com/acaudwell/Gource) to create a visual history of the [bits-service](https://github.com/cloudfoundry-incubator/bits-service)

# Install

```bash
brew bundle
gem install bundler
bundle install
```

# TODO

* Use the same list of repos in `fetch-avatars.rb` and the video generation script

* Add prefixes to each of the [multiple repositories](https://github.com/acaudwell/Gource/wiki/Visualizing-Multiple-Repositories)

* Turn entries of .mailmap into symlinks

* Use the [Pivotal Tracker API](https://github.com/dashofcode/tracker_api) to turn release markers into [gource captions](https://github.com/acaudwell/Gource/wiki/Captions)

# Misc

```bash
# get email addresses
GIT_DIR=../bits-service-release/.git git log --all --format='%cE'

# get names
GIT_DIR=../bits-service-release/.git git log --all --format='%cN' | sort -u
```
