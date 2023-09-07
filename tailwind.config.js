module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js',
    './app/views/components/**/*.html.erb',
    './app/views/components/**/*.rb',
  ],
  theme: {
    extend: {
	},
  },
  plugins: [
	require('@tailwindcss/forms')
  ],
}
