# Cloud Import

::: warning Coming Soon
Direct cloud account import is currently in development. Cloudeval currently works with Infrastructure as Code files (ARM templates and Bicep).

**[Join our waitlist](https://cloudeval.ai/waitlist)** to be notified when this feature launches.
:::

## Current Status

Cloudeval currently supports:

![Infrastructure as Code](../assets/images/features/infra-as-code.png)

- **Infrastructure as Code** - Upload ARM templates and Bicep files
- **Web Editor** - Edit your IaC files directly in the browser
- **AI Analysis** - Get insights about your infrastructure code
- **Diagram Generation** - Visualize your infrastructure from code

<video controls style="min-width: 600px; max-width: 100%; height: auto; display: block; margin: 1.5rem auto;">
  <source src="../assets/videos/automated-diagrams.webm" type="video/webm">
  Your browser does not support the video tag.
</video>

## Coming Soon: Azure Cloud Import

We're working on direct Azure account connections. Here's what's planned:

### Automatic Discovery

1. **Connect Azure Subscription** - Provide read-only API access
2. **Resource Scanning** - Cloudeval scans your Azure subscription
3. **Metadata Collection** - Gathers resource properties and relationships
4. **Relationship Mapping** - Identifies connections and dependencies
5. **Diagram Generation** - Creates interactive visualization

### Planned Features

**Connection Methods:**

- Service Principal (recommended)
- Managed Identity
- OAuth for personal accounts

**Supported Azure Services:**

- Virtual Machines
- Virtual Networks (VNets, Subnets)
- Storage Accounts
- SQL Databases
- App Services
- Resource Groups
- Key Vaults
- Load Balancers
- Azure Functions
- And 40+ more services

**Discovery Methods:**

- Azure Resource Manager API
- Resource Graph queries
- ARM template analysis
- Resource tagging

## Current Workflow: Infrastructure as Code

While cloud import is in development, use Infrastructure as Code:

### Step 1: Export Your Infrastructure

**From Azure:**

```bash
# Export resource group as ARM template
az group export --name my-resource-group --output-file template.json
```

**From Bicep:**

```bash
# Use Bicep files directly, or compile to ARM
az bicep build --file main.bicep
```

### Step 2: Upload to Cloudeval

1. Create a new project
2. Upload your ARM template or Bicep file
3. Cloudeval parses and generates diagram
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
- CI/CD integration ready

**Best Practices:**

- Keep templates in source control
- Export regularly
- Use modular templates
- Document changes

## Get Notified

**[Join our waitlist](https://cloudeval.ai/waitlist)** to be notified when cloud import features launch.

## Next Steps

- **[Upload Your First Template](../getting-started/overview.md)** - Get started with IaC
- **[Try the Playground](https://cloudeval.ai/playground)** - Explore features
- **[Work with ARM Templates](../tutorials/arm-templates.md)** - Deep dive
- **[Use Bicep Files](../tutorials/bicep-files.md)** - Bicep-specific guide

---

**Questions?** [Contact support](../support.md) or [join our community](../community.md)
