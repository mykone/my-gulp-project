var dest = "./dist";
var src = './src';

module.exports = {
  browserSync: {
    server: {
      // We're serving the src folder as well
      // for sass sourcemap linking
      baseDir: [dest, src]
    },
    files: [
      dest + "/**",
      // Exclude Map files
      "!" + dest + "/**.map"
    ]
  },
  sass: {
    src: src + "/sass/*.{sass,scss}",
    dest: dest,
    settings: {
      // Required if you want to use SASS syntax
      // See https://github.com/dlmanning/gulp-sass/issues/81
      sourceComments: 'map',
      imagePath: '/images' // Used by the image-url helper
    }
  },
  images: {
    src: src + "/images/**",
    dest: dest + "/images"
  },
  fonts: {
    src: "./node_modules/bootstrap/fonts/**",
    dest: dest + "/fonts"
  },
  markup: {
    src: src + "/htdocs/**",
    dest: dest
  },
  browserify: {
    //Set path to avoid relative paths hell
    paths: ['./node_modules','./src'],
    // Enable source maps
    debug: true,
    // Additional file extentions to make optional
    extensions: ['.coffee','.jade'],
    // A separate bundle will be generated for each
    // bundle config in the list below
    bundleConfigs: [{
      entries: src + '/app.coffee',
      dest: dest,
      outputName: 'app.js'
    }]
  }
};
