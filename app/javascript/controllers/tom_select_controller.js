import { Controller } from "@hotwired/stimulus"
import TomSelect from "tom-select"


// Connects to data-controller="tom-select"
export default class extends Controller {
  connect() {
	console.log("tom select")

	const selectInput = document.getElementById('select-tags')
	
	let settings = {}

	if (selectInput) {
	  new TomSelect(selectInput, 
		{
      plugins: {
        remove_button:{
          title:'Remove this item',
        }
      },
  		onItemAdd:function(){
  			this.setTextboxValue('');
  			this.refreshOptions();
  		},
      persist: false,
      create: function(input, callback) {
        const data = { name: input }
        const token = document.querySelector('meta[name="csrf-token"]').content
        fetch('/tags', {
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
      },
      onDelete: function(values) {
        return confirm(values.length > 1 ? 'Are you sure you want to remove these ' + values.length + ' items?' : 'Are you sure you want to remove "' + values[0] + '"?');
      }
    })
	}
  }
}
