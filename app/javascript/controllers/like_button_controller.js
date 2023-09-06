import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="like-button"
export default class extends Controller {
  static targets = ["button", "results"]
  connect() {}

  changeColor(event) {
    
    const url = `items/${event.currentTarget.dataset.itemId}/likes`
    
    fetch(url, { 
      method: "POST",
      headers: {
        Accept: "application/json"
      },
      body: {}
    })
      .then(response => response.json()) // Wait for the response and parse it as JSON
      .then((data) => {
        console.log(data.action);
        console.log(data.total);
        
        // Wait for parsing, allowing us to manipulate the data
        if (data.action === "destroy") {
          this.buttonTarget.classList.remove('bg-blue')
          this.resultsTarget.innerText = data.total;
          
        } else {
          this.buttonTarget.classList.add('bg-blue')
          this.resultsTarget.innerText = data.total;
        }
      })
  }
}
