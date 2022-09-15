import { Controller } from "@hotwired/stimulus"
import TomSelect from "tom-select"


// Connects to data-controller="tom-select"
export default class extends Controller {

  static targets = ["filter"]
  static values = { url: String }

  connect() {
	const selectInput = this.filterTarget 

	let settings = {
	  plugins: {
		remove_button:{
		  title:'Remove this item',
		}
	  }

	  if (selectInput) {
		new TomSelect(selectInput, { settings },

		  onItemAdd:function(){
			this.setTextboxValue('');
			this.refreshOptions();
		  },

		  persist: false,

		  create: function(input, callback) {
			const data = { name: input }
			const token = document.querySelector('meta[name="csrf-token"]').content
			fetch(this.urlValue, {
			  method: 'POST',
			  headers:  {
				"X-CSRF-Token": token,
				"Content-Type": "application/json",
				"Accept": "application/json"
			  },
			  body: JSON.stringify(data)
			})
			  .then((response) => {
				return response.json();
			  })
			  .then((data) => {
				callback({value: data.id, text: data.name })
			  });
		  }
	  })
	}
  }
}
