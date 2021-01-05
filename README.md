# Jetpacker

[![Gem](https://img.shields.io/gem/v/jetpacker.svg)](https://github.com/tongueroo/jetpacker)

This is a fork of [rails/webpacker](https://github.com/rails/webpacker) with hacks to get darn webpacker to work with the [Jets](https://rubyonjets.com/) framework.  Credit goes to the original authors of the webpacker gem:

* David Heinemeier Hansson
* Gaurav Tiwari

Looking for maintainers to help with asset compiling for jets. webpacker seems to be the current preferred solution for compiling assets. The JavaScript world is a bit all over the place though 😱 Unsure if there is a better approach and will consider them. Feel like this current approach is a bit madness 😂

## Summary of Changes

Summarizing the changes because they're impossible to remember 🤦🏻‍♂️

* Comment out `require "webpacker/railtie"`
* Replace `Rails.env` with `Jets.env`
* Replace `Rails.root` with `Jets.root`
* Add back `rake_tasks.rb` because the Jets CLI uses it create the webpacker rake tasks
* add `Jets.version` to info command
* Fix generators by using `Rails::Generators::AppGenerator` directly instead of `bin/stubs`
* 2 separate versions: `Jetpacker::VERSION` and `Webpacker::VERSION`
* Default `extract_css: true`

Happy Hackin' 😁
Tung

## Branches and Tags

Here's info on the git branch and tags strategy.

* the latest upstream webpacker version that has been merged back in is v5.2.1
* master: jetpacker fork with latest changes
* forkpoint-1: git tag of point at which forked from rails/webpacker and **original** changes were made. For diff: `git diff forkpoint-1..v0.2.0`
* rails git origin: upstream origin with rails/webpacker origin

## Upgrade Notes

If you run bundle so that jetpacker is updated. IE:

    bundle update
    # or
    bundle update jetpacker

You can update the webpacker-related files with:

    jets webpacker:install

Then update the manually the environment.js

config/webpacker/environment.js:

```javascript
const { environment } = require('@rails/webpacker')
const webpack = require('webpack')
environment.plugins.prepend('Provide', new webpack.ProvidePlugin({
  $: 'jquery',
  jQuery: 'jquery',
  Popper: ['popper.js', 'default']
}))

module.exports = environment
```

This adds jquery so the crud.js works.

## Original README

https://github.com/rails/webpacker
