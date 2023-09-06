# frozen_string_literal: true

class SearchComponent < ApplicationComponent
  def initialize(path:, search_term: nil)
    @path = path
    @search_term = ERB::Util.html_escape(search_term)
  end

  def template
    form(id: "search_form", action: path, accept_charset: "UTF-8", data_remote: "true") do
      div(class: "flex items-center gap-2") do
        whitespace
        label(for: "email", class: "sr-only") { "Email" }
        whitespace
        input(
          name: "search_term",
          id: "search_term",
          value: search_term,
          placeholder: "Search name",
          class: INPUT_CLASS,
          type: "text"
        )
        whitespace
        button(type: "submit", class: SUBMIT_BUTTON_CLASS) { "Search" }

        if search_term.present?
          cancel_button
        end
      end
    end
  end

  private

  attr_reader :path, :search_term

  INPUT_CLASS="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 \
  ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset \
  focus:ring-indigo-600 sm:text-sm sm:leading-6"

  SUBMIT_BUTTON_CLASS= "rounded-md bg-indigo-600 px-2.5 py-1.5 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 \
  focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600"

  CANCEL_BUTTON_CLASS="rounded-full p-1.5 text-indigo-600 focus-visible:outline focus-visible:outline-2 \
  focus-visible:outline-offset-2 focus-visible:outline-indigo-600"

  private_constant :INPUT_CLASS, :SUBMIT_BUTTON_CLASS, :CANCEL_BUTTON_CLASS

  def cancel_button
    whitespace
      a(type: "submit",class: CANCEL_BUTTON_CLASS, id: "clear-search-btn", title: "Reset search", href: path) do
        whitespace
        svg(
          xmlns: "http://www.w3.org/2000/svg",
          fill: "none",
          viewbox: "0 0 24 24",
          stroke_width: "1.5",
          stroke: "currentColor",
          class: "w-5 h-5"
        ) do |s|
          s.path(
            stroke_linecap: "round",
            stroke_linejoin: "round",
            d: "M9.75 9.75l4.5 4.5m0-4.5l-4.5 4.5M21 12a9 9 0 11-18 0 9 9 0 0118 0z"
          )
        end
      end
  end
end
