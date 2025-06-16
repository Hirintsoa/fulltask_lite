# FullTask Lite

A lightweight, modern task list manager built with Rails 7, Hotwire, and Tailwind CSS.

---

## 🚀 Getting Started

### Prerequisites

- **Ruby**: 3.1.0 or later
- **Bundler**: `gem install bundler`
- **SQLite3**: (default database)

### Installation

1. **Clone the repository:**
   ```sh
   git clone git@github.com:Hirintsoa/fulltask_lite.git
   cd fulltask-lite
   ```

2. **Run the setup script:**
   ```sh
   bin/setup
   ```
   This will:
   - Install Ruby gems
   - Prepare the database (migrate, seed, etc.)
   - Clear logs and tempfiles
   - Restart the Rails server

3. **Start the development server:**
   ```sh
   bin/dev
   ```
   This will run both the Rails server and Tailwind CSS watcher (see `Procfile.dev`).

4. **Visit the app:**
   Open [http://localhost:3000](http://localhost:3000) in your browser.

### Running Tests

- **All tests:**
  ```sh
  bin/rails test -v
  ```
- **Integration tests:**
  ```sh
  bin/rails test:integration
  ```

---

## 🛠️ Technology Choices & Rationale

| Technology         | Why?                                                                                   |
|--------------------|---------------------------------------------------------------------------------------|
| **SQLite3**        | Simple, zero-config database for development and testing.                             |
| **Hotwire (Turbo & Stimulus)** | Turbo offers preloading and efficient page updates out of the box so seems like an evident choice for Rails 7. |
| **Tailwind CSS**   | I am a tailwindcss big fan and the auto-generated styling offers a very good starting point. |
| **Importmap**      | Modern JS management without Node bundling, keeping the stack simple.                 |
| **Capybara & Selenium** | System/browser testing for end-to-end feature coverage.                          |

---

## Further more

I have a "postgresql version" of this project locally with action_text set with Trix for task list description field. This can be a good enhancement for the current project.
Steps:
- Install and configure Active Storage and Action Text:
```sh
    bin/rails active_storage:install
```
```sh
    bin/rails action_text:install
```
- Migrate database:
```sh
    bin/rails db:migrate
```
- Add this line to `app/models/task_list.rb`:
```rb
    has_rich_text :content
```
- Replace basic text_area form helper to `rich_text_area`
- Update description display

---

Happy hacking!
