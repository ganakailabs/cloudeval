# Tutorial: Visualize Azure ARM Templates

**Generate Interactive Diagrams from Your ARM Templates**

This tutorial shows you how to upload and visualize Azure ARM templates in Cloudeval, creating interactive diagrams that help you understand your infrastructure before deployment.

<video controls style="min-width: 600px; max-width: 100%; height: auto; display: block; margin: 1.5rem auto;">
  <source src="../assets/videos/automated-diagrams.webm" type="video/webm">
  Your browser does not support the video tag.
</video>

## Prerequisites

- Azure ARM template file (`.json`)
- Cloudeval account (or use [Playground](https://cloudeval.ai/playground))
- Basic understanding of ARM templates

## Step 1: Prepare Your ARM Template

### Option A: Use Existing Template

If you already have an ARM template:

- Ensure it's valid JSON
- Include all required parameters
- Reference any linked templates

### Option B: Export from Azure

Export an existing resource group:

```bash
# Export resource group as ARM template
az group export \
  --name my-resource-group \
  --output-file template.json
```

### Option C: Use Sample Template

Try with a sample template first:

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "storageAccountName": {
      "type": "string"
    }
  },
  "resources": [
    {
      "type": "Microsoft.Storage/storageAccounts",
      "apiVersion": "2021-09-01",
      "name": "[parameters('storageAccountName')]",
      "location": "[resourceGroup().location]",
      "sku": {
        "name": "Standard_LRS"
      },
      "kind": "StorageV2"
    }
  ]
}
```

## Step 2: Upload to Cloudeval

1. **Sign in** to Cloudeval (or use [Playground](https://cloudeval.ai/playground))
2. Click **"New Project"**
3. Name your project (e.g., "Production ARM Template")
4. Choose **"Upload File"**
5. Select your ARM template file
6. Click **"Create Project"**

## Step 3: Understand the Parsed Template

Cloudeval automatically:

1. **Parses JSON** - Validates and reads your template
2. **Identifies Resources** - Finds all resource definitions
3. **Maps Parameters** - Shows required and optional parameters
4. **Detects Dependencies** - Finds resource references
5. **Resolves Variables** - Shows variable values
6. **Maps Outputs** - Identifies template outputs

## Step 4: Explore the Generated Diagram

### Resource Visualization

Each resource in your template appears as a node:

- **Color-coded** by resource type
- **Grouped** by resource group or logical organization
- **Connected** by dependencies

### View Resource Details

Click on any resource to see:

- Resource type and API version
- Properties from template
- Parameters used
- Dependencies
- Outputs (if any)

### Understand Dependencies

Cloudeval shows:

- **Direct Dependencies** - Resources this resource depends on
- **Dependents** - Resources that depend on this one
- **Parameter Dependencies** - Which parameters affect this resource

## Step 5: Use the Code Editor

### View Template

1. Click **"Code Editor"** tab
2. See your full ARM template
3. Syntax highlighting for JSON
4. Navigate through sections

### Edit Template

1. Make changes in the editor
2. See real-time validation
3. View errors if any
4. Diagram updates automatically

### Export Updated Template

1. Make your edits
2. Click **"Export"**
3. Download updated template
4. Use in your deployments

## Step 6: Analyze with AI Chat

Ask questions about your template:

```
"Show me all storage accounts"
```

```
"What parameters are required?"
```

```
"Explain the resource dependencies"
```

```
"Find resources without encryption"
```

```
"What's the deployment order?"
```

## Step 7: Validate Before Deployment

### Check for Issues

Cloudeval identifies:

- Missing required parameters
- Invalid resource references
- Circular dependencies
- Security issues
- Best practice violations

### Review Recommendations

Get AI-powered suggestions:

- Security improvements
- Cost optimizations
- Architecture enhancements
- Parameter defaults

## Real-World Example

### Before Cloudeval

**Problem:** Manually reviewing large ARM templates is time-consuming and error-prone.

**Solution:** Cloudeval visualizes the entire template instantly.

### Template Structure

```json
{
  "resources": [
    {
      "type": "Microsoft.Network/virtualNetworks",
      "name": "vnet-production",
      "dependsOn": []
    },
    {
      "type": "Microsoft.Network/subnets",
      "name": "subnet-web",
      "dependsOn": [
        "[resourceId('Microsoft.Network/virtualNetworks', 'vnet-production')]"
      ]
    },
    {
      "type": "Microsoft.Compute/virtualMachines",
      "name": "vm-web-01",
      "dependsOn": [
        "[resourceId('Microsoft.Network/subnets', 'subnet-web')]",
        "[resourceId('Microsoft.Storage/storageAccounts', 'stg-vm-disks')]"
      ]
    }
  ]
}
```

### Diagram Generated

Cloudeval automatically shows:

- VNet as parent container
- Subnet nested within VNet
- VM connected to subnet
- Storage account dependency
- Clear dependency chain

## Best Practices

### Template Organization

- Use modular templates for large deployments
- Group related resources
- Use consistent naming
- Document with comments

### Parameter Management

- Provide default values
- Use parameter files
- Validate parameter ranges
- Document parameter purposes

### Dependency Management

- Minimize dependencies
- Avoid circular dependencies
- Use explicit dependencies
- Test dependency chains

## Next Steps

- **[Work with Bicep Files](bicep-files.md)** - Visualize Bicep infrastructure
- **[Customize Diagrams](customize-diagrams.md)** - Adjust layouts
- **[Export Diagrams](../features/export.md)** - Share with team
- **[Use AI Chat](ai-chat-basics.md)** - Get insights

---

**Ready for more?** Check out other [tutorials](../index.md) or [feature guides](../features/)
