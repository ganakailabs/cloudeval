# Connect Your Cloud Provider

::: warning Coming Soon
Direct cloud account connection is currently in development. For now, Cloudeval works with Infrastructure as Code files (ARM templates and Bicep).

Use the [Playground](https://cloudeval.ai/playground) to explore features, or upload your ARM/Bicep files to get started immediately.
:::

## Current Status

Cloudeval currently supports:

- **Infrastructure as Code** - Upload ARM templates and Bicep files
- **Web Editor** - Edit your IaC files directly in the browser
- **AI Analysis** - Get insights about your infrastructure code
- **Diagram Generation** - Visualize your infrastructure from code

## Coming Soon: Cloud Import

We're working on direct cloud account connections. Planned features include:

### Azure Integration (Coming Soon)

**Planned Features:**

- Connect Azure subscriptions
- Automatic resource discovery
- Real-time synchronization
- Multi-subscription support
- Resource filtering and scoping

**Expected Setup:**

1. Create Service Principal in Azure AD
2. Assign Reader role at subscription level
3. Enter credentials in Cloudeval
4. Automatic resource discovery begins

**Use Cases:**

- Visualize existing infrastructure
- Compare code vs. deployed resources
- Track changes over time
- Security audits

### AWS Integration (Future)

- Connect AWS accounts
- Multi-account support
- Cross-region visualization

### GCP Integration (Future)

- Connect GCP projects
- Multi-project support
- Resource hierarchy visualization

## Get Notified

**[Join our waitlist](https://cloudeval.ai/waitlist)** to be notified when cloud import features launch.

## Current Workflow

While cloud import is in development, use this workflow:

### Step 1: Export Your Infrastructure

**From Azure:**

```bash
# Export resource group as ARM template
az group export --name my-resource-group --output-file template.json
```

**From Bicep:**

```bash
# If you have Bicep files, use them directly
# Or compile to ARM first
az bicep build --file main.bicep
```

### Step 2: Upload to Cloudeval

1. Create a new project
2. Upload your ARM template or Bicep file
3. Cloudeval generates the diagram
4. Edit and analyze your infrastructure

### Step 3: Keep in Sync

- Export templates regularly
- Upload updated files
- Compare versions over time
- Track changes

## Benefits of Current Approach

**Advantages:**

- Works with any IaC setup
- Version control friendly
- No cloud credentials needed
- Works offline
- Review before deployment

**Best Practices:**

- Keep templates in source control
- Export regularly
- Use modular templates
- Document changes

## Alternative: Use Playground

Try Cloudeval features without uploading files:

**[Launch Playground →](https://cloudeval.ai/playground)**

The playground includes:

- Sample infrastructure diagrams
- Interactive features
- AI chat examples
- Tutorial content

## Next Steps

- **[Upload Your First Template](overview.md#step-3-create-your-first-project)** - Get started with IaC
- **[Try the Playground](https://cloudeval.ai/playground)** - Explore features
- **[Work with ARM Templates](../tutorials/arm-templates.md)** - Deep dive
- **[Use Bicep Files](../tutorials/bicep-files.md)** - Bicep-specific guide

---

**Questions?** [Contact support](../support.md) or [join our community](../community.md)
