gulp = require("gulp")
express = require("express")
mongoose = require("mongoose")
bodyParser = require("body-parser")
cors = require("cors")

# MongoDB
mongoose.connect "mongodb://localhost/rest_test"

gulp.task 'server', ->
	# Express
	app = express()

	#app.options('*', cors());
	app.use cors()
	app.use bodyParser.urlencoded(extended: true)
	app.use bodyParser.json()

	# Routes
	app.use "/api", require("./../../routes/api")

	# Start server
	app.listen 3000
	console.log "API is running on port 3000"
