const { environment } = require('@rails/webpacker')

module.exports = environment

environment.entry.append('application', './app/javascript/application.js')