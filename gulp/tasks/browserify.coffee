gulp = require('gulp')
browserify = require("browserify")
watchify = require('watchify')
bundleLogger = require('../util/bundleLogger')
handleErrors = require('../util/handleErrors')
source = require('vinyl-source-stream')
config = require('../config').browserify

gulp.task "browserify", (callback) ->
	bundleQueue = config.bundleConfigs.length

	browserifyThis = (bundleConfig) ->

		bundler = browserify(
		# Required watchify args
			cache: {}
			packageCache: {}
			fullPaths: true

		# Specify the entry point of your app
			entries: bundleConfig.entries

		# Add file extentions to make optional in your requires
			extensions: config.extensions

		# Enable source maps!
			debug: config.debug

			paths: config.paths
		)
		# console.log "bundler:%o",bundler

		bundle = ->

			# Log when bundling starts
			bundleLogger.start bundleConfig.outputName

			# Report compile errors

			###
   		Use vinyl-source-stream to make the stream gulp compatible.
   		Specifiy the desired output filename here.
			###

			# Specify the output destination
			bundler
			.bundle()
			.on("error", handleErrors)
			.pipe(source(bundleConfig.outputName))
			.pipe(gulp.dest(bundleConfig.dest))
			.on("end", reportFinished)

		if global.isWatching

			# Wrap with watchify and rebundle on changes
			watcher = watchify(bundler)

			# console.log "bundler:%o", bundler

			# Rebundle on update
			watcher.on "update", bundle

		reportFinished = ->

			# Log when bundling completes
			bundleLogger.end bundleConfig.outputName
			if bundleQueue
				bundleQueue--

				# If queue is empty, tell gulp the task is complete. # https://github.com/gulpjs/gulp/blob/master/docs/API.md#accept-a-callback
				callback()  if bundleQueue is 0
			return

		bundle()


	# Start bundling with Browserify for each bundleConfig specified
	config.bundleConfigs.forEach browserifyThis
	return
