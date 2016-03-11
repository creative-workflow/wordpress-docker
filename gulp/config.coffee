fs           = require 'fs'
yaml         = require 'js-yaml'
execFileSync = require('child_process').execFileSync

config = yaml.safeLoad(
                    fs.readFileSync(
                        './gulp/config.yml', 'utf8'))

config.dockerIp = execFileSync('./scripts/ip.sh').toString()
                                                 .replace(/^\s+|\s+$/g, '')

module.exports = config
