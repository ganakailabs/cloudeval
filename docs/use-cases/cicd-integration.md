# CI/CD Integration

**Automate Infrastructure Visualization in Your Deployment Pipeline**

Integrate Cloudeval into your CI/CD pipeline to automatically generate diagrams, run security checks, and validate infrastructure changes as part of your deployment process.

## Use Case Overview

**Who:** DevOps engineers, platform teams, SREs

**When:**
- Automated deployments
- Infrastructure validation
- Security scanning
- Documentation generation
- Change tracking

**Why:** Automate infrastructure visualization and validation to catch issues early and maintain up-to-date documentation

## Workflow

### Step 1: Configure CI/CD Integration

1. **Set up Cloudeval API** - Get API key
2. **Add to pipeline** - Configure CI/CD workflow
3. **Define triggers** - When to run (on PR, on merge, scheduled)
4. **Configure outputs** - What to generate (diagrams, reports)

### Step 2: Automated Analysis

1. **Trigger on changes** - When Infrastructure as Code changes
2. **Upload templates** - Send to Cloudeval API
3. **Run analysis** - Security, cost, validation
4. **Generate outputs** - Diagrams, reports

### Step 3: Validation Gates

1. **Check security** - Fail if critical issues
2. **Validate configuration** - Ensure templates are valid
3. **Estimate costs** - Check budget compliance
4. **Approve or block** - Gate deployment

### Step 4: Documentation Generation

1. **Generate diagrams** - Automatic diagram creation
2. **Create reports** - Security, cost, change reports
3. **Update documentation** - Commit to docs repository
4. **Notify team** - Share updates

## Integration Examples

### GitHub Actions

**Example Workflow:**
```yaml
name: Infrastructure Validation

on:
  pull_request:
    paths:
      - 'infrastructure/**/*.json'
      - 'infrastructure/**/*.bicep'

jobs:
  validate:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      
      - name: Cloudeval Security Analysis
        uses: cloudeval/action@v1
        with:
          api-key: ${{ secrets.CLOUDEVAL_API_KEY }}
          template: infrastructure/main.json
          checks: security,cost,validation
          
      - name: Generate Diagram
        uses: cloudeval/action@v1
        with:
          api-key: ${{ secrets.CLOUDEVAL_API_KEY }}
          template: infrastructure/main.json
          output: diagram.png
          
      - name: Upload Diagram
        uses: actions/upload-artifact@v3
        with:
          name: infrastructure-diagram
          path: diagram.png
          
      - name: Comment on PR
        uses: actions/github-script@v6
        with:
          script: |
            github.rest.issues.createComment({
              issue_number: context.issue.number,
              owner: context.repo.owner,
              repo: context.repo.repo,
              body: 'Infrastructure diagram generated and security analysis completed.'
            })
```

### Azure DevOps

**Example Pipeline:**
```yaml
trigger:
  branches:
    include:
      - main
  paths:
    include:
      - infrastructure/*

stages:
- stage: Validate
  jobs:
  - job: InfrastructureValidation
    steps:
    - task: Cloudeval@1
      inputs:
        apiKey: '$(CLOUDEVAL_API_KEY)'
        templatePath: 'infrastructure/main.json'
        checks: 'security,cost,validation'
        
    - task: Cloudeval@1
      inputs:
        apiKey: '$(CLOUDEVAL_API_KEY)'
        templatePath: 'infrastructure/main.json'
        outputPath: '$(Build.ArtifactStagingDirectory)/diagram.png'
        
    - task: PublishBuildArtifacts@1
      inputs:
        pathToPublish: '$(Build.ArtifactStagingDirectory)'
        artifactName: 'infrastructure-diagram'
```

### GitLab CI

**Example Pipeline:**
```yaml
stages:
  - validate
  - deploy

infrastructure_validation:
  stage: validate
  image: cloudeval/cli:latest
  script:
    - cloudeval analyze --template infrastructure/main.json
    - cloudeval generate --template infrastructure/main.json --output diagram.png
  artifacts:
    paths:
      - diagram.png
  only:
    changes:
      - infrastructure/**/*
```

## Use Cases

### Pre-Deployment Validation

**Goal:** Validate infrastructure before deployment

**Process:**
1. **On PR** - Trigger validation
2. **Security check** - Fail if critical issues
3. **Cost check** - Warn if over budget
4. **Validation** - Ensure templates are valid
5. **Approve or block** - Gate deployment

**Benefits:**
- Catch issues early
- Prevent bad deployments
- Maintain security standards
- Control costs

### Automated Documentation

**Goal:** Keep documentation up-to-date

**Process:**
1. **On merge** - Generate diagrams
2. **Update docs** - Commit to docs repo
3. **Create reports** - Security, cost reports
4. **Notify team** - Share updates

**Benefits:**
- Always current documentation
- Automatic updates
- Consistent format
- Reduced manual work

### Security Scanning

**Goal:** Continuous security validation

**Process:**
1. **On every change** - Run security analysis
2. **Check for issues** - Identify vulnerabilities
3. **Block if critical** - Fail pipeline on critical issues
4. **Report findings** - Share with team

**Benefits:**
- Continuous security monitoring
- Early vulnerability detection
- Automated compliance checks
- Security standards enforcement

### Cost Monitoring

**Goal:** Track and control costs

**Process:**
1. **On changes** - Estimate costs
2. **Compare to budget** - Check compliance
3. **Alert if over** - Notify if over budget
4. **Track trends** - Monitor cost changes

**Benefits:**
- Budget compliance
- Cost visibility
- Early cost alerts
- Cost trend tracking

## Best Practices

### Fail Fast

**Configuration:**
- **Critical issues** - Fail pipeline immediately
- **High issues** - Require approval
- **Medium/Low** - Warn but don't block

**Benefits:**
- Catch issues early
- Prevent bad deployments
- Maintain quality standards

### Comprehensive Checks

**Include:**
- **Security** - Security analysis
- **Cost** - Cost estimation
- **Validation** - Template validation
- **Best practices** - Compliance checks

**Benefits:**
- Comprehensive validation
- Multiple quality gates
- Reduced issues
- Better deployments

### Artifact Management

**Store:**
- **Diagrams** - Visual documentation
- **Reports** - Analysis reports
- **History** - Track changes over time
- **Metadata** - Change information

**Benefits:**
- Historical tracking
- Audit trail
- Documentation archive
- Change analysis

### Notification Strategy

**Notify:**
- **On failures** - Immediate alerts
- **On success** - Status updates
- **On changes** - Change notifications
- **Regular reports** - Periodic summaries

**Benefits:**
- Team awareness
- Quick response
- Status visibility
- Regular updates

## API Integration

### REST API

**Endpoints:**
- `POST /api/v1/analyze` - Analyze template
- `POST /api/v1/generate` - Generate diagram
- `GET /api/v1/reports` - Get reports
- `POST /api/v1/validate` - Validate template

**Example:**
```bash
curl -X POST https://api.cloudeval.ai/v1/analyze \
  -H "Authorization: Bearer ${CLOUDEVAL_API_TOKEN}" \
  -H "Content-Type: application/json" \
  -d '{
    "template": "...",
    "checks": ["security", "cost", "validation"]
  }'
```

### CLI Tool

**Commands:**
- `cloudeval analyze` - Run analysis
- `cloudeval generate` - Generate diagram
- `cloudeval validate` - Validate template
- `cloudeval report` - Generate report

**Example:**
```bash
cloudeval analyze --template infrastructure/main.json \
  --checks security,cost,validation \
  --output report.json
```

## Next Steps

- **[Getting Started](../getting-started/overview.md)** - Learn Cloudeval basics
- **[Security Analysis](../features/security-analysis.md)** - Security features
- **[Cost Optimization](../features/cost-optimization.md)** - Cost features
- **[Code Reviews](code-reviews.md)** - Related use case

---

**Ready to automate your infrastructure validation?** [Try Cloudeval now](https://cloudeval.ai/signup)

