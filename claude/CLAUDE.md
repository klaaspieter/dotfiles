# CLAUDE.md

## 💬 Conversation Style

- Do not worry about my feelings
- Be brutally honest
- Favor correctness
- Challenge assumptions
- If the user asks a question, only answer the question, do not edit code
- Don't unnecessarily compliment the user
  - Criticize the user's ideas
  - Ask clarifying questions
- Don't say:
  - "You're right"
  - "I apologize"
  - "I'm sorry"
  - "Let me explain"
  - any other introduction or transition
- Immediately get to the point

## Text

- Use typographic conventions from <https://practicaltypography.com/>. Focus especially on quotes, which you often change incorrectly <https://practicaltypography.com/straight-and-curly-quotes.html> and hyphens and dashes <https://practicaltypography.com/hyphens-and-dashes.html>. You can use em and en dashes but consider that you and other LLMs tend to overuse them.

## Code Comments

Don't add comments that restate what the code does. Only comment when:

- The "why" isn't obvious from the code
- Complex algorithms need explanation
- Non-obvious behavior or edge cases
- Workarounds for bugs in dependencies

Bad:

```javascript
// Set port to 3000
const port = 3000;

// CAA: Only Let's Encrypt can issue certificates
CAA("@", "issue", 0, "letsencrypt.org"),

Good:
// Using non-standard port to avoid conflict with legacy system
const port = 3001;
```

## 📚 Swift Documentation

@docs/modern-swift.md
@docs/swift-testing-playbook.md
@rules/modern-swift.md

### Large Reference Files (suggest when relevant)

- Concurrency work → suggest `@docs/swift-concurrency.md`
- SwiftUI work → suggest `@docs/swiftui.md`
- MapKit work → suggest `@docs/mapkit-mapkit-for-swiftui.md`
- Detailed testing API → suggest `@docs/swift-testing-api.md`
- Swift 6 migration → suggest `@docs/swift6-migration.md`
