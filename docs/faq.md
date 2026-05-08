# FAQ & Troubleshooting

**Common Questions and Solutions**

## General Questions

### What is Cloudeval?

Cloudeval is an AI-powered cloud infrastructure visualization platform that generates architecture diagrams from Infrastructure as Code, starting with Azure ARM templates. It answers questions about your infrastructure and helps teams review cost, security, and architecture concerns.

### How does Cloudeval work?

Cloudeval works with your Infrastructure as Code files:

1. Upload your ARM template
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

**Available Now:**

- Azure ARM Templates (JSON)
- Modular templates (linked templates)
- Parameter files

**Coming Soon:**

- Azure Bicep files - Planned ([View roadmap](https://cloudeval.ai/home/roadmap))
- Terraform - Planned ([View roadmap](https://cloudeval.ai/home/roadmap))
- AWS CloudFormation - Planned ([View roadmap](https://cloudeval.ai/home/roadmap))

### Can I connect my Azure account directly?

!!! warning "Coming Soon"
Direct Azure account connection is listed on the roadmap as part of the "Azure Cloud Sync v1" release area. [View roadmap](https://cloudeval.ai/home/roadmap) for current timing.

    Cloudeval currently works with Infrastructure as Code files (ARM templates). **[Join our waitlist](https://cloudeval.ai/waitlist)** to be notified when this feature launches.

For now, you can:

- Upload ARM templates
- Export templates from Azure and upload them
- Use the [Playground](https://cloudeval.ai/playground) to explore features

### Do I need to install anything?

No. Cloudeval is a web-based application. Just sign up and use it in your browser.

## Getting Started

### How do I get started?

1. **[Try the Playground](https://cloudeval.ai/playground)** - Explore features without signing up
2. **[Sign up](https://cloudeval.ai/signup)** for a free account
3. **[Upload your ARM template](getting-started/overview.md)**
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

!!! info "Coming Soon"
Bicep file support is listed on the roadmap. [View roadmap](https://cloudeval.ai/home/roadmap) for current timing.

    Currently, you can upload ARM templates (JSON). Bicep support will be available soon.

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

Bicep support is listed on the roadmap. When native support is available, the planned workflow covers:

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

- Compile Bicep to ARM before upload, or use the native Bicep workflow when support is available
- Keep module files together
- Validate module references before upload

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

### Template Parsing Issues

#### Template parsing fails

**Problem:** Can't parse ARM template or Bicep file

**Symptoms:**

- Error message when uploading
- Empty diagram after upload
- Parsing errors in console

**Solutions:**

1. **Verify file format:**

   - ARM templates must be valid JSON
   - If you start from Bicep, compile or validate it with Azure CLI before upload
   - Check file encoding (UTF-8)

2. **Check for syntax errors:**

   - Validate JSON syntax (use JSON validator)
   - Validate Bicep syntax before compiling to ARM (use `az bicep build`)
   - Look for missing commas, brackets, quotes

3. **Validate with Azure CLI:**

   ```bash
   # For ARM templates
   az deployment group validate \
     --resource-group my-rg \
     --template-file template.json \
     --parameters @parameters.json

   # For Bicep files
   az bicep build --file main.bicep
   ```

4. **Check required parameters:**

   - Ensure all required parameters are provided
   - Verify parameter types match
   - Check for missing parameter files

5. **Modular templates:**
   - Upload all linked templates
   - Verify template references are correct
   - Check for circular dependencies

#### Partial parsing (some resources missing)

**Problem:** Only some resources appear in diagram

**Solutions:**

- Check if resources are in correct section (`resources` array)
- Verify resource definitions are complete
- Check for conditional resources (may be filtered)
- Ensure all linked templates are uploaded

#### Linked template errors

**Problem:** Linked templates not resolving

**Solutions:**

- Upload all linked template files
- Verify template reference URLs/paths
- Check template schema versions
- Ensure templates are accessible

### Diagram Issues

#### Diagram doesn't update after editing

**Problem:** Changes in editor don't reflect in diagram

**Solutions:**

1. **Save changes:**

   - Press `Ctrl+S` (or `Cmd+S` on Mac) to save
   - Enable auto-save in settings
   - Wait for save confirmation

2. **Refresh diagram:**

   - Click "Refresh Diagram" button
   - Close and reopen diagram view
   - Reload the page

3. **Check for errors:**

   - Look for syntax errors in editor
   - Verify template is valid
   - Check error panel for issues

4. **Verify changes:**
   - Ensure changes are actually saved
   - Check if changes are in correct file
   - Verify file is the one being displayed

#### Empty or incomplete diagram

**Problem:** Diagram shows no resources or missing resources

**Solutions:**

- Verify template has resources defined
- Check if resources are in `resources` section
- Ensure template parsed successfully
- Check filters aren't hiding resources
- Verify all linked templates uploaded

#### Diagram is too cluttered

**Problem:** Too many resources, hard to read

**Solutions:**

- Use filters to focus on specific resources
- Group related resources
- Use different views (network, security, cost)
- Break into multiple diagrams
- Adjust zoom level

#### Resources not connecting

**Problem:** Dependencies not showing connections

**Solutions:**

- Verify `dependsOn` properties are correct
- Check resource references are valid
- Ensure related resources are in template
- Check for circular dependencies
- Verify resource IDs match

### Export Issues

#### Export fails or times out

**Problem:** Export doesn't complete or fails

**Solutions:**

1. **Reduce complexity:**

   - Filter out unnecessary resources
   - Simplify diagram before export
   - Break large diagrams into smaller ones

2. **Try different format:**

   - PNG for images
   - SVG for vector graphics
   - PDF for documents
   - Lower resolution if needed

3. **Check browser:**

   - Update browser to latest version
   - Clear browser cache
   - Try different browser
   - Disable browser extensions

4. **Contact support:**
   - If issue persists, contact support
   - Include error message
   - Share template details (if possible)

#### Poor export quality

**Problem:** Exported image is blurry or low quality

**Solutions:**

- Use higher resolution setting
- Export as SVG instead of PNG
- Check zoom level before export
- Use PDF format for documents
- Ensure high DPI setting

#### Missing elements in export

**Problem:** Some resources don't appear in exported file

**Solutions:**

- Ensure resources are visible in diagram
- Check filters aren't hiding resources
- Refresh diagram before export
- Try different export format
- Verify all resources are in view

### AI Chat Issues

#### AI chat doesn't understand my question

**Problem:** AI gives incorrect or irrelevant answers

**Solutions:**

1. **Be more specific:**

   - Include resource names
   - Specify what you're looking for
   - Provide context

2. **Use natural language:**

   - Ask questions like you would a colleague
   - Avoid overly technical jargon
   - Use clear, simple language

3. **Provide context:**

   - Reference specific resources
   - Mention what you're trying to do
   - Include relevant details

4. **Try rephrasing:**
   - Ask the same question differently
   - Break complex questions into parts
   - Use different keywords

#### AI chat is slow

**Problem:** AI responses take too long

**Solutions:**

- Check internet connection
- Wait for response (may take 10-30 seconds)
- Simplify question
- Try again if timeout
- Check if service is available

#### AI chat not available

**Problem:** AI chat feature not working

**Solutions:**

- Refresh the page
- Check if feature is enabled
- Verify account has access
- Try different browser
- Contact support

### Performance Issues

#### Diagram generation is slow

**Problem:** Takes too long to generate diagram

**Solutions:**

- **Large templates:** Break into smaller modules
- **Complex dependencies:** Simplify relationships
- **Many modules:** Reduce number of linked templates
- **Network:** Check internet connection speed
- **Browser:** Close other tabs/applications

#### Editor is slow or laggy

**Problem:** Code editor is unresponsive

**Solutions:**

- Refresh the page
- Close and reopen editor
- Reduce file size (if very large)
- Check browser performance
- Try different browser

#### Page loads slowly

**Problem:** Cloudeval takes long to load

**Solutions:**

- Check internet connection
- Clear browser cache
- Disable browser extensions
- Try different browser
- Check if service is available

### Permission and Access Issues

#### Can't upload files

**Problem:** File upload fails or not allowed

**Solutions:**

- Check file size (may have limits)
- Verify file format is supported
- Check browser permissions
- Try different file
- Contact support if persists

#### Can't access project

**Problem:** Can't open or view project

**Solutions:**

- Verify you have access permissions
- Check if project exists
- Refresh the page
- Try logging out and back in
- Contact project owner

#### Collaboration issues

**Problem:** Can't collaborate or share

**Solutions:**

- Verify collaboration is enabled
- Check sharing permissions
- Ensure team members have access
- Verify account type supports collaboration
- Contact support

### Browser and Compatibility

#### Feature doesn't work in my browser

**Problem:** Some features not working

**Solutions:**

- **Update browser:** Use latest version
- **Supported browsers:** Chrome, Firefox, Edge, Safari (latest)
- **Enable JavaScript:** Required for all features
- **Disable extensions:** May interfere
- **Try different browser:** Isolate issue

#### Mobile device issues

**Problem:** Cloudeval doesn't work well on mobile

**Solutions:**

- Use desktop/laptop for best experience
- Some features optimized for desktop
- Try mobile browser (limited features)
- Use responsive view if available

### Account and Billing

#### Can't sign up

**Problem:** Sign up process fails

**Solutions:**

- Check email is valid
- Verify password meets requirements
- Check if account already exists
- Try different email
- Contact support

#### Account limits reached

**Problem:** Hit free tier limits

**Solutions:**

- Review account limits
- Delete old projects
- Upgrade to Pro tier
- Contact support for options

#### Billing questions

**Problem:** Questions about pricing or billing

**Solutions:**

- Check pricing page
- Review account settings
- Contact billing support
- Review terms of service

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
