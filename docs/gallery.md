# Diagram Gallery Scenarios

Use this page to understand the kinds of diagrams Cloudeval can help you prepare from Infrastructure as Code. The scenario descriptions are useful for planning and documentation; dedicated gallery screenshots should be added when production-ready examples are available.

![Automated diagram generation](assets/images/features/automated-diagrams.png)

## Simple Architecture

### Basic Web Application

A simple three-tier web application with frontend, backend, and database.

**Infrastructure:**
- App Service (Frontend)
- App Service (Backend API)
- SQL Database
- Storage Account
- Application Insights

**Key Features:**
- Clear resource relationships
- Logical grouping
- Dependency visualization
- Clean layout

<!-- Image placeholder: assets/images/gallery/simple-web-app.png -->

**Use Case:** Small applications, proof of concepts, learning

---

### Single Resource Group

A focused view of resources within a single resource group.

**Infrastructure:**
- Virtual Network
- Subnets
- Network Security Groups
- Virtual Machines
- Load Balancer

**Key Features:**
- Network topology visualization
- Security group relationships
- Subnet organization
- Resource grouping

<!-- Image placeholder: assets/images/gallery/single-rg.png -->

**Use Case:** Resource group documentation, network planning

---

## Medium Complexity

### Microservices Architecture

A microservices-based application with multiple services and shared infrastructure.

**Infrastructure:**
- Multiple App Services (Microservices)
- API Management
- Service Bus
- Cosmos DB
- Key Vault
- Application Gateway

**Key Features:**
- Service relationships
- Message flow visualization
- API gateway integration
- Shared services identification

<!-- Image placeholder: assets/images/gallery/microservices.png -->

**Use Case:** Microservices documentation, architecture reviews, team onboarding

---

### Multi-Environment Setup

Development, staging, and production environments with shared services.

**Infrastructure:**
- Three environments (Dev, Staging, Prod)
- Shared Key Vault
- Shared Container Registry
- Environment-specific resources
- Cross-environment dependencies

**Key Features:**
- Environment separation
- Shared resource identification
- Environment comparison
- Dependency mapping

<!-- Image placeholder: assets/images/gallery/multi-env.png -->

**Use Case:** Environment management, deployment planning, cost analysis

---

## Complex Architecture

### Enterprise Application

A comprehensive enterprise application with multiple components and integrations.

**Infrastructure:**
- Frontend (App Services, CDN)
- API Layer (API Management, Functions)
- Business Logic (App Services, Logic Apps)
- Data Layer (SQL, Cosmos DB, Storage)
- Integration (Service Bus, Event Grid)
- Security (Key Vault, Managed Identity)
- Monitoring (Application Insights, Log Analytics)

**Key Features:**
- Complete architecture overview
- Layer visualization
- Integration points
- Security boundaries
- Monitoring coverage

<!-- Image placeholder: assets/images/gallery/enterprise-app.png -->

**Use Case:** Enterprise architecture documentation, compliance reviews, stakeholder presentations

---

### Hybrid Cloud Architecture

On-premises and cloud resources with connectivity.

**Infrastructure:**
- On-premises resources
- Azure resources
- ExpressRoute/VPN connections
- Hybrid services
- Cross-cloud dependencies

**Key Features:**
- Hybrid connectivity visualization
- Cloud boundary identification
- Integration points
- Network topology

<!-- Image placeholder: assets/images/gallery/hybrid-cloud.png -->

**Use Case:** Hybrid cloud planning, migration documentation, connectivity reviews

---

## Before and After

### From Code to Diagram

See how Infrastructure as Code translates to visual diagrams.

**Before: ARM Template**
```json
{
  "resources": [
    {
      "type": "Microsoft.Web/sites",
      "name": "my-web-app",
      "properties": {
        "serverFarmId": "[resourceId('Microsoft.Web/serverfarms', 'my-app-plan')]"
      }
    },
    {
      "type": "Microsoft.Web/serverfarms",
      "name": "my-app-plan"
    }
  ]
}
```

**After: Visual Diagram**

<!-- Image placeholder: assets/images/gallery/before-after.png -->

**Benefits:**
- Instant understanding
- Relationship clarity
- Dependency visualization
- Easy sharing

---

## Diagram Types

### Network Topology

Focus on network resources and connections.

**Shows:**
- Virtual networks
- Subnets
- Network security groups
- Load balancers
- VPN gateways
- ExpressRoute connections

<!-- Image placeholder: assets/images/gallery/network-topology.png -->

**Use Case:** Network planning, security reviews, connectivity documentation

---

### Security View

Highlight security-related resources and configurations.

**Shows:**
- Key Vaults
- Managed Identities
- Network Security Groups
- Security boundaries
- Encryption configurations

<!-- Image placeholder: assets/images/gallery/security-view.png -->

**Use Case:** Security audits, compliance reviews, security documentation

---

### Cost View

Visualize cost-related information and optimization opportunities.

**Shows:**
- Resource costs
- Cost drivers
- Optimization opportunities
- Reserved instances
- Cost trends

<!-- Image placeholder: assets/images/gallery/cost-view.png -->

**Use Case:** Cost reviews, budget planning, optimization analysis

---

## Customization Examples

### Custom Layouts

Examples of custom diagram layouts and styling.

**Customizations:**
- Resource grouping
- Color schemes
- Layout algorithms
- Annotations
- Filters

<!-- Image placeholder: assets/images/gallery/custom-layout.png -->

**Use Case:** Presentations, documentation, stakeholder communication

---

### Annotated Diagrams

Diagrams with custom annotations and notes.

**Annotations:**
- Resource labels
- Notes and explanations
- Highlights
- Groupings
- Flow indicators

<!-- Image placeholder: assets/images/gallery/annotated.png -->

**Use Case:** Documentation, onboarding, presentations, training

---

## Export Examples

### Presentation Format

Diagrams optimized for presentations.

**Format:** PNG, High Resolution
**Features:**
- Clean background
- Legend included
- Resource names visible
- Professional styling

<!-- Image placeholder: assets/images/gallery/presentation.png -->

---

### Documentation Format

Diagrams formatted for documentation.

**Format:** SVG, PDF
**Features:**
- Scalable vector graphics
- Print-ready
- Metadata included
- Searchable text

<!-- Image placeholder: assets/images/gallery/documentation.png -->

---

## Get Started

Ready to create your own diagrams?

1. **[Sign up for free](https://cloudeval.ai/signup)** - No credit card required
2. **[Upload your ARM template](getting-started/overview.md)** - Generate your first diagram
3. **[Customize your diagram](tutorials/customize-diagrams.md)** - Make it perfect
4. **[Export and share](features/export.md)** - Share with your team

---

## Share Your Diagrams

Have a great diagram you'd like to share?

- **Submit to gallery** - Share your architecture
- **Community showcase** - Inspire others
- **Best practices** - Learn from examples

[Contact us](support.md) to submit your diagram to the gallery.

---

**Want to see more?** [Try Cloudeval now](https://cloudeval.ai/playground) or [view tutorials](tutorials/arm-templates.md)
