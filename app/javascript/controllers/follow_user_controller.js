import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="followuser"
export default class extends Controller {
  static targets = ["button"]
  connect() {
    
  }
  followuser(event){
    console.log(event.currentTarget.dataset.userId);
    const url = `/follows`
    
    fetch(url, { 
      method: "POST",
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        followed_id: event.currentTarget.dataset.userId,
      })
    })
      .then(response => response.json()) // Wait for the response and parse it as JSON
      .then((data) => {
        // Wait for parsing, allowing us to manipulate the data
        if (data.action === "destroy") {
          this.buttonTarget.innerText = "Follow";

        } else {
          this.buttonTarget.innerText = "unFollow";
        }
      })
  }
}

