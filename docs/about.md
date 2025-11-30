# About Cloudeval

**AI-Powered Cloud Infrastructure Visualization from Infrastructure as Code**

## What is Cloudeval?

Cloudeval is an AI-powered platform that automatically visualizes your Azure infrastructure from ARM templates and Bicep files, answers questions about your setup, and helps optimize costs. Built specifically for DevOps engineers, SREs, and cloud architects who work with Infrastructure as Code.

## Who is Cloudeval For?

### DevOps Engineers

- Visualize infrastructure changes before deployment
- Review ARM templates and Bicep files visually
- Document architecture for team onboarding
- Troubleshoot issues with visual context

### Site Reliability Engineers (SREs)

- Map production infrastructure from code
- Identify dependencies and failure points
- Plan capacity and scaling strategies
- Visualize infrastructure for incident response

### Cloud Architects

- Design new infrastructure visually
- Compare architecture options
- Create documentation for stakeholders
- Review Infrastructure as Code before deployment

### Security Teams

- Audit infrastructure code for security gaps
- Visualize network topologies
- Document compliance requirements
- Identify security issues in templates

## Core Capabilities

### Infrastructure as Code Support

Upload and visualize your Infrastructure as Code:

**Supported Formats:**

- Azure ARM Templates (JSON)
- Azure Bicep files
- Modular templates (linked templates)
- Parameter files
- Terraform (Coming Soon)
- AWS CloudFormation (Coming Soon)

**Features:**

- Automatic resource discovery
- Dependency mapping
- Parameter visualization
- Output tracking
- Variable resolution

### AI-Powered Diagram Generation

Our AI automatically generates intelligent layouts that show resource relationships, dependencies, and network flows from your Infrastructure as Code.

**Features:**

- Automatic resource grouping
- Intelligent layout algorithms
- Relationship detection
- Network flow visualization
- Parameter and variable mapping

### Chat with Your Infrastructure

Ask questions in natural language about your infrastructure code and get instant answers.

**Example Questions:**

- "Show me all storage accounts in this template"
- "What resources depend on this virtual network?"
- "Find resources without tags"
- "Explain the network topology"
- "What parameters are required?"

### Web Editor for Infrastructure as Code

Edit your ARM templates and Bicep files directly in the browser with syntax highlighting and validation.

**Features:**

- Syntax highlighting for ARM and Bicep
- Auto-completion
- Error detection
- Format validation
- Multi-file support
- Real-time diagram updates

**Supported Formats:**

- ARM Templates (JSON)
- Azure Bicep
- Parameter files
- Linked templates

### Export & Share

Export diagrams in multiple formats for documentation, presentations, and collaboration.

**Export Formats:**

- PNG (high-resolution images)
- SVG (vector graphics)
- Visio (VSDX format)
- draw.io (XML format)
- PDF (documentation)

### Real-Time Collaboration

Work with your team on infrastructure diagrams with real-time updates and comments.

**Features:**

- Live collaboration
- Comment threads
- Version history
- Team permissions

### Security Analysis

Automatically identify security issues in your Infrastructure as Code.

**Checks:**

- Publicly accessible resources
- Missing encryption
- Inadequate access controls
- Compliance violations
- Network security gaps
- Parameter security

### Cost Optimization

Get AI-powered recommendations to reduce cloud spending based on your infrastructure code.

**Insights:**

- Resource sizing recommendations
- Cost estimates
- Optimization opportunities
- Reserved instance suggestions

## Key Benefits

### Save Time

Stop manually drawing diagrams. Cloudeval generates accurate architecture diagrams from your Infrastructure as Code in seconds, not hours.

### Reduce Errors

Always up-to-date diagrams that reflect your actual infrastructure code, eliminating documentation drift.

### Improve Collaboration

Share visual diagrams with stakeholders who don't understand Infrastructure as Code.

### Make Better Decisions

Visualize relationships and dependencies to make informed architecture decisions before deployment.

### Optimize Costs

Identify cost optimization opportunities through visual analysis of resource configurations.

## Technology

Cloudeval is built with modern web technologies:

- **Frontend:** Next.js, React, TypeScript
- **Visualization:** React Flow
- **AI:** OpenAI GPT models
- **Code Editor:** Monaco Editor
- **Infrastructure:** Vercel, Azure

## Security & Privacy

- **No Cloud Access Required:** Works entirely from your Infrastructure as Code files
- **Encrypted Storage:** All data encrypted at rest and in transit
- **SOC 2 Compliant:** Enterprise-grade security standards
- **GDPR Compliant:** Full data privacy compliance
- **No Data Sharing:** Your infrastructure code is never shared

## Getting Started

Ready to visualize your infrastructure?

1. **[Try the Playground](https://cloudeval.ai/playground)** - Explore features
2. **[Sign up for free](https://cloudeval.ai/signup)**
3. **[Upload your ARM template or Bicep file](getting-started/overview.md)**

---

**Questions?** [Contact us](support.md) or [join our community](community.md)
