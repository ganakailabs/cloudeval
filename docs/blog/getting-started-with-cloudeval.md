# Getting Started with Cloudeval: A Beginner's Guide

**Published:** January 15, 2025  
**Author:** Cloudeval Team  
**Category:** Tutorials

## Introduction

Cloudeval helps teams turn Infrastructure as Code into diagrams that are easier to inspect, explain, and share. If you are new to the product, start with a sample project in the playground, then upload an Azure ARM template when you are ready to work with your own infrastructure.

## What Cloudeval Helps With

Cloudeval is designed for infrastructure review workflows:

- Generate architecture diagrams from ARM templates.
- Inspect resources, parameters, variables, and dependencies visually.
- Ask AI chat questions about the current project.
- Edit Infrastructure as Code in the browser.
- Export diagrams for reviews, documentation, and onboarding.

## Prerequisites

Before you begin, make sure you have:

- A modern browser.
- An Azure ARM template (`.json`) if you want to use your own infrastructure.
- Basic familiarity with Azure resource concepts.

You can also use the [Playground](https://cloudeval.ai/playground) without uploading files.

## Your First Project

### Step 1: Explore the Playground

Open the [Playground](https://cloudeval.ai/playground) to see how diagrams, chat, and navigation work before connecting your own workflow.

### Step 2: Create an Account

Sign up at [cloudeval.ai](https://cloudeval.ai/signup), verify your email, and open the dashboard.

### Step 3: Upload an ARM Template

Create a new project, choose **Upload File**, and select your ARM template. Cloudeval parses the file, maps resources and dependencies, and generates an interactive diagram.

### Step 4: Ask Your First Question

Open AI chat and try:

```text
What resources are in this template?
```

Then narrow the answer:

```text
Show resources without tags
```

## Common Issues

### Template Parsing Fails

Validate the file locally before uploading:

```bash
az deployment group validate \
  --resource-group my-rg \
  --template-file template.json \
  --parameters @parameters.json
```

### Diagram Looks Empty

Check that the template has a `resources` array and that linked templates were uploaded if the main template depends on them.

### Diagram Is Hard to Read

Use filters, grouping, and saved views to focus on one service area or review concern at a time.

## Next Steps

1. **[Getting Started Guide](../getting-started/overview.md)** - Full onboarding flow.
2. **[ARM Template Tutorial](../tutorials/arm-templates.md)** - Template-specific walkthrough.
3. **[AI Chat Tutorial](../tutorials/ai-chat-basics.md)** - Better prompts and follow-ups.
4. **[Contribution Guide](../contribute.md)** - Improve these docs.

Have questions? [Open an issue](https://github.com/ganakailabs/cloudeval/issues) or [contact support](../support.md).
