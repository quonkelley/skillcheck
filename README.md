# SkillCheck: Credential Verification Engine

SkillCheck is a digital credentialing platform built to bridge the "trust gap" in technical mentorship. It provides a secure, API-driven way for mentors to issue verifiable skill badges to learners.

## 🚀 Key Features
- **Secure Verification:** Uses unique hash-based lookups to prevent ID enumeration and unauthorized access.
- **AI-Native Workflow:** Developed using an AI-assisted engineering process (Cursor/Gemini/Claude) to port MVC patterns from Django to Ruby on Rails.
- **Evidence-Backed:** Metadata support for linking GitHub PRs, project URLs, or other artifacts as proof of skill competency.

## 🛠 Tech Stack
- **Backend:** Ruby on Rails 7.1 (API-Only mode + ActionView)
- **Database:** PostgreSQL (JSONB for metadata storage)
- **Testing:** RSpec (coverage on core verification logic)
- **Frontend:** Tailwind CSS (Responsive badge views)

## 🏁 Getting Started
1. **Clone and Install:**
   ```bash
   git clone [your-repo-link]
   cd skillcheck
   bundle install
   ```

2. **Database Setup:**
   ```bash
   bin/rails db:prepare
   ```

3. **Run Tests:**
   ```bash
   bundle exec rspec
   ```

4. **View a Badge:**
   Start the server with:
   ```bash
   bin/rails s
   ```
   Then visit one of the seeded URLs (example):
   - `http://localhost:3000/verify/623baf0005e9aec2ef3b50cd67faf0e0`

