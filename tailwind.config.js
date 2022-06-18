module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ],
  theme: {
    extend: {
	  fontFamily: {
		'custom': ['Libre Baskerville', 'serif']
	  }
	},
  },
  plugins: [],
}
