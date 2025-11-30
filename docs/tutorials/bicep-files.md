# Tutorial: Visualize Azure Bicep Files

**Generate Interactive Diagrams from Your Bicep Infrastructure Code**

This tutorial shows you how to upload and visualize Azure Bicep files in Cloudeval, creating interactive diagrams that help you understand your infrastructure before deployment.

<video controls style="min-width: 600px; max-width: 100%; height: auto; display: block; margin: 1.5rem auto;">
  <source src="../assets/videos/automated-diagrams.webm" type="video/webm">
  Your browser does not support the video tag.
</video>

## Prerequisites

- Azure Bicep file (`.bicep`)
- Cloudeval account (or use [Playground](https://cloudeval.ai/playground))
- Basic understanding of Bicep syntax

## Step 1: Prepare Your Bicep File

### Option A: Use Existing Bicep File

If you already have Bicep files:
- Ensure valid Bicep syntax
- Include all required parameters
- Reference any modules

### Option B: Create Sample Bicep

Try with a sample file first:

```bicep
@description('Name of the storage account')
param storageAccountName string

@description('Location for all resources')
param location string = resourceGroup().location

resource storageAccount 'Microsoft.Storage/storageAccounts@2021-09-01' = {
  name: storageAccountName
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
}

output storageAccountName string = storageAccount.name
```

### Option C: Compile from Existing ARM

If you have ARM templates:

```bash
# Decompile ARM to Bicep
az bicep decompile --file template.json --out main.bicep
```

## Step 2: Upload to Cloudeval

1. **Sign in** to Cloudeval (or use [Playground](https://cloudeval.ai/playground))
2. Click **"New Project"**
3. Name your project (e.g., "Production Bicep")
4. Choose **"Upload File"**
5. Select your Bicep file (`.bicep`)
6. For modular templates, upload all related files
7. Click **"Create Project"**

## Step 3: Understand the Parsed Bicep

Cloudeval automatically:

1. **Parses Bicep** - Validates syntax and structure
2. **Identifies Resources** - Finds all resource declarations
3. **Maps Parameters** - Shows required and optional parameters
4. **Resolves Modules** - Expands module references
5. **Detects Dependencies** - Finds resource dependencies
6. **Maps Outputs** - Identifies template outputs
7. **Shows Variables** - Displays variable definitions

## Step 4: Explore the Generated Diagram

### Resource Visualization

Each resource in your Bicep file appears as a node:
- **Color-coded** by resource type
- **Grouped** logically
- **Connected** by dependencies and references

### View Resource Details

Click on any resource to see:
- Resource type and API version
- Properties from Bicep
- Parameters used
- Dependencies
- Outputs (if any)

### Understand Dependencies

Cloudeval shows:
- **Direct Dependencies** - Resources this depends on
- **Dependents** - Resources that depend on this
- **Module Dependencies** - Module relationships
- **Parameter Dependencies** - Parameter usage

## Step 5: Work with Modules

### View Module Structure

If your Bicep uses modules:

1. Cloudeval shows module hierarchy
2. Click modules to see contents
3. View module parameters
4. See module outputs

### Example Modular Bicep

```bicep
// main.bicep
module vnetModule 'modules/vnet.bicep' = {
  name: 'vnet-deployment'
  params: {
    vnetName: 'vnet-production'
    location: location
  }
}

module vmModule 'modules/vm.bicep' = {
  name: 'vm-deployment'
  params: {
    vnetId: vnetModule.outputs.vnetId
    location: location
  }
}
```

Cloudeval visualizes:
- Module relationships
- Parameter flow
- Output dependencies
- Deployment order

## Step 6: Use the Code Editor

### View Bicep File

1. Click **"Code Editor"** tab
2. See your full Bicep file
3. Syntax highlighting for Bicep
4. Navigate through sections

### Edit Bicep File

1. Make changes in the editor
2. See real-time validation
3. View syntax errors
4. Diagram updates automatically

### Export Updated File

1. Make your edits
2. Click **"Export"**
3. Download updated Bicep file
4. Use in your deployments

## Step 7: Analyze with AI Chat

Ask questions about your Bicep file:

```
"Show me all storage accounts"
```

```
"What parameters does this module require?"
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

```
"Show me all module outputs"
```

## Step 8: Validate Before Deployment

### Check for Issues

Cloudeval identifies:
- Missing required parameters
- Invalid resource references
- Circular dependencies
- Syntax errors
- Security issues
- Best practice violations

### Review Recommendations

Get AI-powered suggestions:
- Security improvements
- Cost optimizations
- Architecture enhancements
- Parameter defaults
- Module organization

## Real-World Example

### Before Cloudeval

**Problem:** Understanding complex Bicep files with multiple modules is difficult.

**Solution:** Cloudeval visualizes the entire Bicep structure instantly.

### Bicep Structure

```bicep
// Network module
module vnet 'modules/network.bicep' = {
  name: 'network'
  params: {
    vnetName: 'vnet-prod'
    location: location
  }
}

// Compute module
module compute 'modules/compute.bicep' = {
  name: 'compute'
  params: {
    subnetId: vnet.outputs.subnetId
    location: location
  }
}

// Storage module
module storage 'modules/storage.bicep' = {
  name: 'storage'
  params: {
    location: location
  }
}
```

### Diagram Generated

Cloudeval automatically shows:
- Module hierarchy
- Parameter flow between modules
- Output dependencies
- Resource relationships
- Deployment order

## Best Practices

### Module Organization

- Keep modules focused and reusable
- Use consistent naming
- Document module purposes
- Version your modules

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

### Code Organization

- Group related resources
- Use consistent naming
- Add descriptions
- Comment complex logic

## Next Steps

- **[Work with ARM Templates](arm-templates.md)** - Visualize ARM templates
- **[Customize Diagrams](customize-diagrams.md)** - Adjust layouts
- **[Export Diagrams](../features/export.md)** - Share with team
- **[Use AI Chat](ai-chat-basics.md)** - Get insights

---

**Ready for more?** Check out other [tutorials](../index.md) or [feature guides](../features/)

