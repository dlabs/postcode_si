# postcode_si by Oto Brglez - <oto.brglez@opalab.com>

express = require 'express'
postcodes = require("./postcode_si").postcodes

app = express()

app.get '/near', (req,res)->

  if typeof(req.query['lat']) == "undefined" or typeof(req.query['lon']) == "undefined"
    return res.status(422).json error: "lat/lon missing!"

  res.json postcodes.near [parseFloat(req.query.lat), parseFloat(req.query.lon)]

port = process.env.PORT || 3000
app.listen port, ->
  console.log "Running."
