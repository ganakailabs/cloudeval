# FAQ & Troubleshooting

**Common Questions and Solutions**

## General Questions

### What is Cloudeval?

Cloudeval is an AI-powered cloud infrastructure visualization platform that automatically generates architecture diagrams from your Infrastructure as Code (ARM templates and Bicep files), answers questions about your infrastructure, and helps optimize costs.

### How does Cloudeval work?

Cloudeval works with your Infrastructure as Code files:

1. Upload your ARM template or Bicep file
2. Cloudeval parses and analyzes the code
3. Maps resources and dependencies
4. Generates interactive diagrams
5. You can ask questions, edit code, and export diagrams

### Is Cloudeval secure?

Yes. Cloudeval:

- **No Cloud Access Required** - Works entirely from your code files
- **Encrypted Storage** - All data encrypted at rest and in transit
- **SOC 2 Compliant** - Enterprise-grade security standards
- **GDPR Compliant** - Full data privacy compliance
- **No Data Sharing** - Your infrastructure code is never shared

### What Infrastructure as Code formats are supported?

- Azure ARM Templates (JSON)
- Azure Bicep files
- Modular templates (linked templates)
- Parameter files
- Terraform (Coming Soon)
- AWS CloudFormation (Coming Soon)

### Can I connect my Azure account directly?

::: warning Coming Soon
Direct Azure account connection is currently in development. Cloudeval currently works with Infrastructure as Code files.

**[Join our waitlist](https://cloudeval.ai/waitlist)** to be notified when this feature launches.
:::

For now, you can:

- Upload ARM templates or Bicep files
- Export templates from Azure and upload them
- Use the [Playground](https://cloudeval.ai/playground) to explore features

### Do I need to install anything?

No. Cloudeval is a web-based application. Just sign up and use it in your browser.

## Getting Started

### How do I get started?

1. **[Try the Playground](https://cloudeval.ai/playground)** - Explore features without signing up
2. **[Sign up](https://cloudeval.ai/signup)** for a free account
3. **[Upload your ARM template or Bicep file](getting-started/overview.md)**
4. Generate your first diagram

### What is the Playground?

The [Playground](https://cloudeval.ai/playground) is an interactive demo where you can:

- Explore sample infrastructure diagrams
- Try the AI chat assistant
- Test diagram features
- Learn Cloudeval without uploading files

**No sign-up required!**

### How do I upload my ARM template?

1. Create a new project
2. Click **"Upload File"**
3. Select your ARM template (`.json`) file
4. Cloudeval automatically parses and generates the diagram

### How do I upload my Bicep file?

1. Create a new project
2. Click **"Upload File"**
3. Select your Bicep file (`.bicep`)
4. For modular templates, upload all related files
5. Cloudeval automatically parses and generates the diagram

## Infrastructure as Code

### What ARM template features are supported?

Cloudeval supports:

- Resource definitions
- Parameters and variables
- Dependencies (dependsOn)
- Outputs
- Linked templates
- Nested templates
- Template functions

### What Bicep features are supported?

Cloudeval supports:

- Resource declarations
- Parameters and variables
- Modules
- Outputs
- Loops and conditions
- Functions
- Decorators

### Can I edit my templates in Cloudeval?

Yes! Cloudeval includes a web-based code editor:

- Syntax highlighting
- Auto-completion
- Error detection
- Real-time diagram updates
- Export updated files

### How do I handle modular templates?

For ARM templates:

- Upload the main template
- Upload linked templates separately
- Cloudeval resolves references

For Bicep:

- Upload all module files
- Cloudeval shows module hierarchy
- Visualize module dependencies

## Diagrams & Visualization

### How long does it take to generate a diagram?

Typical times:

- Small template (< 20 resources): 5-10 seconds
- Medium template (20-100 resources): 10-30 seconds
- Large template (100-500 resources): 30-60 seconds
- Very large template (> 500 resources): 1-2 minutes

### Why is my diagram empty?

**Possible causes:**

- Template has no resource definitions
- Template structure is incorrect
- Resources are in wrong section
- Syntax errors preventing parsing

**Solutions:**

- Verify template structure
- Check for syntax errors
- Ensure resources are in `resources` section
- Try validating with Azure CLI first

### Can I customize the diagram layout?

Yes. You can:

- Reposition nodes manually
- Choose layout algorithms
- Group resources
- Apply color schemes
- Add annotations

### How do I export diagrams?

Click **Export** and choose format:

- PNG (images)
- SVG (vector)
- Visio (VSDX)
- draw.io (XML)
- PDF (documents)

## AI Chat

### How does the AI chat work?

The AI analyzes your Infrastructure as Code and answers questions in natural language. It understands your resources, relationships, and can provide insights.

### What can I ask the AI?

You can ask about:

- Resources and their properties
- Parameters and variables
- Dependencies and relationships
- Security issues
- Cost optimization
- Architecture explanations

### Is the AI accurate?

The AI uses your actual Infrastructure as Code, so it's highly accurate. However, it's a tool to assist you - always verify critical information.

### Can the AI modify my infrastructure?

No. The AI can only read and analyze. It cannot make changes to your code or infrastructure.

## Troubleshooting

### Template parsing fails

**Problem:** Can't parse ARM template or Bicep file

**Solutions:**

- Verify file is valid JSON (for ARM) or valid Bicep syntax
- Check for syntax errors
- Ensure all required parameters are provided
- Try validating with Azure CLI first:

  ```bash
  # For ARM
  az deployment group validate --resource-group my-rg --template-file template.json

  # For Bicep
  az bicep build --file main.bicep
  ```

### Diagram doesn't update after editing

**Solutions:**

- Save your changes in the editor
- Refresh the diagram view
- Check for syntax errors
- Verify changes are valid

### Export fails or is poor quality

**Solutions:**

- Try different format
- Reduce diagram complexity
- Use higher resolution
- Contact support

### AI chat doesn't understand my question

**Solutions:**

- Be more specific
- Use natural language
- Provide context
- Try rephrasing

## Performance & Limits

### What's the maximum template size?

Cloudeval can handle:

- **Free tier:** Up to 1,000 resources per template
- **Pro tier:** Up to 10,000 resources per template
- **Enterprise:** Unlimited resources

### Why is diagram generation slow?

**Possible causes:**

- Very large template
- Complex dependencies
- Many modules
- Network latency

**Solutions:**

- Break templates into smaller modules
- Simplify dependencies
- Contact support for optimization

## Security & Privacy

### Where is my code stored?

Your Infrastructure as Code files are stored:

- Encrypted at rest
- Secure cloud storage
- Compliant data centers
- Your region (if available)

### Can I delete my data?

Yes. You can:

- Delete projects
- Remove uploaded files
- Delete account
- Request data export

### Do you share my code?

No. Your Infrastructure as Code files are never shared with third parties.

## Support

### How do I get help?

- **[Documentation](index.md)** - Browse guides
- **[Playground](https://cloudeval.ai/playground)** - Try features
- **[Community Discord](community.md)** - Ask questions
- **[Support Email](support.md)** - Direct help

### What's your response time?

- **Community:** Community members help each other
- **Email:** Within 24 hours
- **Enterprise:** Priority support with SLA

---

**Still have questions?** [Contact support](support.md) or [join our community](community.md)
