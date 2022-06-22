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
		'custom': ['Syne', 'sans-serif']
	  }
	},
  },
  plugins: [
	require('@tailwindcss/forms')
  ],
}
