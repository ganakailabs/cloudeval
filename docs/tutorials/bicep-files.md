# Tutorial: Prepare Azure Bicep Files for Cloudeval

!!! warning "Native Bicep support is planned"
    Azure Bicep file support is listed on the roadmap as part of the "Full Infrastructure as Code Support" release area. [View roadmap](https://cloudeval.ai/home/roadmap) for current timing.

Use this guide if your infrastructure is authored in Bicep today. Until native Bicep upload is available, compile Bicep to ARM, then use Cloudeval's ARM template workflow.

## What You Will Do

1. Validate your Bicep file locally.
2. Compile Bicep to an ARM template.
3. Upload the generated ARM template to Cloudeval.
4. Use diagrams and AI chat to inspect the infrastructure.

## Prerequisites

- Azure CLI with Bicep support
- A Bicep file, such as `main.bicep`
- A Cloudeval account, or access to the [Playground](https://cloudeval.ai/playground)

## Step 1: Validate Bicep

Run:

```bash
az bicep build --file main.bicep
```

This catches syntax errors and generates `main.json` in the same directory.

## Step 2: Review the Generated ARM Template

Open the generated `main.json` and confirm it contains the expected:

- `parameters`
- `variables`
- `resources`
- `outputs`

If your Bicep uses modules, confirm the compiled output includes the expected nested or linked deployment structure.

## Step 3: Upload to Cloudeval

1. Sign in to Cloudeval.
2. Click **New Project**.
3. Choose **Upload File**.
4. Select the generated ARM template, such as `main.json`.
5. Upload any linked templates required by the generated template.
6. Click **Create Project**.

## Step 4: Inspect the Diagram

After Cloudeval generates the diagram, review:

- Resource groups and logical grouping
- Network resources and dependencies
- Storage, compute, and database resources
- Parameter-driven names and configuration
- Outputs that are useful for deployment or documentation

## Step 5: Ask AI Chat About the Template

Try:

```text
What resources are in this compiled template?
```

```text
Explain the deployment order
```

```text
Find resources without tags
```

```text
What should I review before deploying this template?
```

## Troubleshooting

### Bicep Build Fails

- Check for syntax errors in `main.bicep`.
- Confirm referenced modules exist at the expected paths.
- Update Azure CLI if the Bicep version is old.

### Generated ARM Template Is Missing Resources

- Check conditional resources and parameter defaults.
- Confirm module outputs and references are wired correctly.
- Build from the root Bicep file that represents the full deployment.

### Cloudeval Parsing Fails

- Confirm the generated ARM file is valid JSON.
- Upload linked templates if the generated template depends on them.
- Try a smaller module first to isolate the issue.

## Next Steps

- **[Work with ARM Templates](arm-templates.md)** - Use the generated ARM template in Cloudeval.
- **[Customize Diagrams](customize-diagrams.md)** - Adjust layouts and filters.
- **[Export Diagrams](../features/export.md)** - Share with your team.
- **[Use AI Chat](ai-chat-basics.md)** - Ask better infrastructure questions.
