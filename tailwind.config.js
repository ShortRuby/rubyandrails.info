module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js',
	'./app/components/**/*.html.erb',
    './app/components/**/*.rb',
  ],
  theme: {
    extend: {
	  fontFamily: {
		'custom': ['DM Sans', 'sans-serif']
	  }
	},
  },
  plugins: [
	require('@tailwindcss/forms')
  ],
}
