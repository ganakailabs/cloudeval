# Using the AI Chat Assistant

Use Cloudeval's AI chat when you want a fast explanation of the infrastructure in your current project. The assistant uses the uploaded template and current diagram context to answer questions about resources, dependencies, security posture, cost signals, and deployment structure.

<video controls preload="metadata" style="min-width: 600px; max-width: 100%; height: auto; display: block; margin: 1.5rem auto;">
  <source src="../assets/videos/chat-with-your-cloud.webm" type="video/webm">
  Your browser does not support the video tag.
</video>

## Open Chat

1. Open a project with a generated diagram.
2. Click the **chat icon** in the bottom-right corner.
3. Or press `Ctrl+K` (`Cmd+K` on macOS).
4. Ask your first question.

## Start with Practical Questions

Try one of these:

```text
Show me all storage accounts
```

```text
What resources depend on this virtual network?
```

```text
Find resources without tags
```

```text
Explain the deployment order
```

The assistant can answer in text and, when supported by the UI, highlight relevant resources in the diagram.

## Common Question Types

### Discovery

Use discovery questions to understand what the template contains:

```text
List all virtual networks and subnets
```

```text
Show me all databases
```

```text
What parameters are required?
```

### Architecture

Use architecture questions to understand relationships:

```text
Explain the network topology
```

```text
What is connected to this resource?
```

```text
What is the dependency chain for this application?
```

### Security

Use security questions to find risky configuration patterns:

```text
Find publicly accessible resources
```

```text
Show resources without encryption settings
```

```text
Which resources are missing tags used for ownership?
```

### Cost and Operations

Use cost and operations questions to prepare reviews:

```text
Show the resources most likely to affect monthly cost
```

```text
Find resources that look over-provisioned
```

```text
What should I review before deploying this template?
```

## Use Diagram Context

The assistant understands the current project context, including:

- Uploaded Infrastructure as Code files
- Parsed resources and relationships
- Selected resources
- Current diagram view
- Recent questions in the conversation

For example:

```text
Show me all databases
```

Then ask:

```text
Which ones are connected to public network resources?
```

You do not need to repeat the full context in every follow-up.

## Tips for Better Answers

- Ask for one outcome at a time.
- Include exact resource names when you have them.
- Use follow-up questions to narrow the answer.
- Ask the assistant to highlight resources when you need visual confirmation.
- Verify critical security, cost, and deployment decisions before acting on them.

## Keyboard Shortcuts

- `Ctrl+K` / `Cmd+K` - Open chat
- `Esc` - Close chat
- `Enter` - Send message
- `Shift+Enter` - Add a new line
- `↑` - Previous message
- `↓` - Next message

## Limits

The assistant can:

- Read and analyze the project context available to Cloudeval.
- Explain resources, relationships, and deployment structure.
- Highlight or filter resources when the UI supports it.
- Suggest areas to review.

The assistant cannot:

- Modify your cloud infrastructure.
- Deploy changes.
- Access data that is not available in the uploaded project context.
- Replace human review for production security, cost, or compliance decisions.

## Next Steps

- **[AI Chat Tutorial](../tutorials/ai-chat-basics.md)** - Practice deeper workflows.
- **[Customize Diagrams](../tutorials/customize-diagrams.md)** - Prepare cleaner views.
- **[Export Diagrams](../features/export.md)** - Share findings.
- **[Collaborate](../features/collaboration.md)** - Review with your team.
