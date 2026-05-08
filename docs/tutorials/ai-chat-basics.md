# Tutorial: Use the AI Assistant to Explain Your Infrastructure

This tutorial helps you get useful answers from Cloudeval's AI chat assistant after you upload an Infrastructure as Code file and generate a diagram.

## What You Will Learn

By the end, you will know how to:

- Ask discovery questions about resources in a template.
- Use follow-up questions without repeating context.
- Ask architecture, security, cost, and deployment-order questions.
- Use chat answers alongside the diagram instead of treating them as a replacement for review.

## Prerequisites

- A Cloudeval project with a generated diagram
- An uploaded Azure ARM template
- Basic familiarity with the resources in your template

## Open Chat

1. Open your project.
2. Click the **chat icon** in the bottom-right corner.
3. Or press `Ctrl+K` (`Cmd+K` on macOS).
4. Type a question and press `Enter`.

## Ask Discovery Questions

Start by asking what exists:

```text
What resources are in this template?
```

```text
List all storage accounts
```

```text
Show all virtual networks and subnets
```

```text
What parameters are required for deployment?
```

Good discovery questions are narrow enough that the assistant can return a concrete list.

## Ask Architecture Questions

After you know what exists, ask how the pieces relate:

```text
Explain the network topology
```

```text
What resources depend on this virtual network?
```

```text
What is the deployment order?
```

```text
Which resources are connected to this database?
```

When possible, select a resource in the diagram first, then ask a question such as:

```text
What is connected to this?
```

## Ask Security Questions

Use security questions to find configurations that deserve human review:

```text
Find publicly accessible resources
```

```text
Show resources without encryption settings
```

```text
Which resources are missing ownership tags?
```

```text
What should I review before deploying this template to production?
```

!!! note
    Treat security answers as review assistance. Verify critical findings against the template and your organization's security standards.

## Ask Cost and Operations Questions

Use these questions during planning or review:

```text
Which resources are likely to drive cost?
```

```text
Find resources that look over-provisioned
```

```text
What operational risks should I check?
```

```text
What monitoring or diagnostic settings are defined?
```

## Use Follow-Up Questions

The assistant keeps conversation context. You can ask a sequence like this:

```text
Show me all databases
```

```text
Which ones have public network access?
```

```text
Highlight the risky ones in the diagram
```

Follow-ups work best when each question narrows the previous answer.

## Improve Weak Answers

If the answer is too broad, rephrase with a resource type, environment, or expected output:

**Too broad:**

```text
Tell me about my infrastructure
```

**Better:**

```text
Summarize the network resources and call out anything publicly reachable
```

**Better:**

```text
List storage accounts, their access settings, and any tags used for ownership
```

## Keyboard Shortcuts

- `Ctrl+K` / `Cmd+K` - Open chat
- `Esc` - Close chat
- `Enter` - Send message
- `Shift+Enter` - New line
- `↑` - Previous message
- `↓` - Next message
- `Tab` - Autocomplete, when available

## Limits

The AI chat can read and analyze your project context, but it cannot deploy infrastructure, modify cloud resources, or replace production review. Use it to move faster, then verify important decisions in the source template and deployment process.

## Next Steps

- **[Customize Diagrams](customize-diagrams.md)** - Prepare focused views.
- **[Export Diagrams](../features/export.md)** - Share answers and diagrams.
- **[Collaborate](../features/collaboration.md)** - Review with your team.
