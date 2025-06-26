import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["container", "addButton", "counter"]
  static values = { 
    maxTasks: { type: Number, default: 5 },
    currentCount: { type: Number, default: 0 }
  }

  connect() {
    const taskFields = this.containerTarget.querySelectorAll('.task-field')
    let visibleCount = 0
    
    taskFields.forEach(field => {
      const hasErrors = field.querySelector('.text-red-600.text-sm.mt-1')
      
      if (hasErrors) {
        // Only show fields with validation errors
        field.classList.remove('hidden')
        visibleCount++
      } else {
        field.classList.add('hidden')
      }
    })
    
    this.currentCountValue = visibleCount
    this.updateUI()
  }

  fieldHasContent(field) {
    const inputs = field.querySelectorAll('input, textarea, select')
    return Array.from(inputs).some(input => {
      if (input.type === 'checkbox') {
        return input.checked
      }
      return input.value && input.value.trim() !== '' && input.value !== input.querySelector('option[value=""]')?.value
    })
  }

  addTask() {
    if (this.currentCountValue >= this.maxTasksValue) return
    
    const taskFields = this.containerTarget.querySelectorAll('.task-field.hidden')
    const nextHiddenField = taskFields[0]
    
    if (nextHiddenField) {
      nextHiddenField.classList.remove('hidden')
      this.currentCountValue++
      this.updateUI()
      
      const titleInput = nextHiddenField.querySelector('input[type="text"]')
      if (titleInput) titleInput.focus()
    }
  }

  removeTask(event) {
    const taskField = event.target.closest('.task-field')
    if (!taskField) return
    
    // Clear all inputs in this task field
    const inputs = taskField.querySelectorAll('input, textarea, select')
    inputs.forEach(input => {
      if (input.type === 'checkbox') {
        input.checked = false
      } else {
        input.value = ''
        // Reset select to first option (usually empty)
        if (input.tagName === 'SELECT' && input.options.length > 0) {
          input.selectedIndex = 0
        }
      }
    })
    
    taskField.classList.add('hidden')
    this.currentCountValue--
    this.updateUI()
  }

  updateUI() {
    // Update counter
    if (this.hasCounterTarget) {
      this.counterTarget.textContent = this.currentCountValue
    }
    
    // Update add button state
    if (this.hasAddButtonTarget) {
      if (this.currentCountValue >= this.maxTasksValue) {
        this.addButtonTarget.disabled = true
        this.addButtonTarget.classList.add('opacity-50', 'cursor-not-allowed')
        this.addButtonTarget.textContent = `Maximum ${this.maxTasksValue} tasks reached`
      } else {
        this.addButtonTarget.disabled = false
        this.addButtonTarget.classList.remove('opacity-50', 'cursor-not-allowed')
        this.addButtonTarget.textContent = '+ Add Task'
      }
    }
  }
} 