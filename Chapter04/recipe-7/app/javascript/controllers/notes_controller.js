import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["noteItem"]

  connect() {
  }

  newNote() {
    // Scroll to the form area
    const formSection = document.querySelector('.new-note-section')
    if (formSection) {
      formSection.scrollIntoView({ behavior: 'smooth' })
    }
    
    // Focus on the title input
    const titleInput = document.querySelector('.form-input')
    if (titleInput) {
      titleInput.focus()
    }
  }

  selectNote(event) {
    // Remove active class from all notes
    this.noteItemTargets.forEach(item => {
      item.classList.remove('active')
    })
    
    // Add active class to clicked note
    const noteItem = event.currentTarget.closest('.note-item')
    if (noteItem) {
      noteItem.classList.add('active')
    }
  }
} 