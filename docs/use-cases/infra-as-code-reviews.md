# Code Reviews

!!! note "Canonical page"
    This page is a legacy duplicate of [Code Reviews](code-reviews.md). Keep it available for existing links, but use [Code Reviews](code-reviews.md) for navigation and future edits.

**Visualize Infrastructure as Code Changes Before Merging**

Use Cloudeval to review ARM template changes in pull requests, understand the impact of changes, and catch issues before they reach production.

## Use Case Overview

**Who:** DevOps engineers, cloud architects, team leads, code reviewers

**When:**
- Before merging pull requests
- Reviewing infrastructure changes
- Understanding change impact
- Catching configuration errors
- Validating architecture decisions

**Why:** Visual review helps catch issues and understand changes faster than code-only reviews

## Workflow

### Step 1: Review Pull Request

1. **Open pull request** with Infrastructure as Code changes
2. **Identify changed files** - ARM templates, or planned Bicep files when support is available
3. **Download changed files** or access via PR integration
4. **Upload to Cloudeval** - Create temporary project for review

### Step 2: Generate Comparison Diagrams

1. **Upload baseline** - Current production template
2. **Upload changes** - Proposed changes
3. **Compare diagrams** - See visual diff
4. **Identify differences** - Resources added, removed, modified

### Step 3: Analyze Changes

1. **Review new resources** - What's being added
2. **Review removed resources** - What's being deleted
3. **Review modifications** - What's changing
4. **Check dependencies** - Impact on other resources

### Step 4: Validate Changes

1. **Run security analysis** - Check for security issues
2. **Review cost impact** - Estimate cost changes
3. **Validate configuration** - Check for errors
4. **Test relationships** - Verify dependencies

### Step 5: Provide Feedback

1. **Add comments** - Specific feedback on changes
2. **Suggest improvements** - Better configurations
3. **Approve or request changes** - Based on review
4. **Document findings** - For future reference

## Key Features for Code Reviews

### Visual Diff

**Compare Diagrams:**
- **Side-by-side** - Baseline vs. changes
- **Highlight differences** - Color-coded changes
- **Resource changes** - Added (green), removed (red), modified (yellow)
- **Dependency changes** - New or broken relationships

**Benefits:**
- Quick understanding of changes
- Visual impact assessment
- Catch unintended changes
- Understand scope of changes

### Change Analysis

**Automatic Analysis:**
- **New resources** - What's being added
- **Removed resources** - What's being deleted
- **Modified resources** - What's changing
- **Dependency changes** - Impact on relationships

**Example Output:**
```
Changes Detected:
- Added: 3 resources (VM, Storage Account, Load Balancer)
- Removed: 1 resource (Old VM)
- Modified: 2 resources (Database tier, Network configuration)
- Dependencies: 5 new connections, 2 removed
```

### Security Review

**Automatic Security Checks:**
- **New vulnerabilities** - Security issues in changes
- **Removed security** - Security that's being removed
- **Configuration risks** - Potential security problems
- **Compliance impact** - Compliance changes

**Example:**
```
Security Review:
New Issue: Storage account allows public access
Removed: Encryption configuration removed from database
Improved: Added network security group rules
```

### Cost Impact

**Cost Analysis:**
- **New costs** - Additional spending
- **Cost savings** - Reduced spending
- **Cost changes** - Modified resource costs
- **Total impact** - Overall cost change

**Example:**
```
Cost Impact:
+ $450/month - New VM and storage
- $200/month - Removed old VM
Net Change: +$250/month
```

## Code Review Scenarios

### Scenario 1: New Feature Deployment

**Context:** Adding new microservice to infrastructure

**Review Process:**

1. **Upload changed template** to Cloudeval
2. **Generate diagram** - See new resources
3. **Review security** - Check for vulnerabilities
4. **Verify dependencies** - Ensure correct connections
5. **Check costs** - Understand cost impact
6. **Approve or request changes**

**Key Checks:**
- New resources properly configured
- Security best practices followed
- Dependencies correctly set
- Cost is acceptable

### Scenario 2: Infrastructure Update

**Context:** Upgrading database tier and scaling

**Review Process:**

1. **Compare before/after** - Visual diff
2. **Review modifications** - What's changing
3. **Check impact** - Affected resources
4. **Validate configuration** - Correct settings
5. **Test dependencies** - No broken connections
6. **Approve changes**

**Key Checks:**
- Upgrade path is correct
- No breaking changes
- Dependencies still work
- Configuration is valid

### Scenario 3: Security Hardening

**Context:** Adding security improvements

**Review Process:**

1. **Review security changes** - What's being improved
2. **Check for regressions** - No security removed
3. **Verify configurations** - Security settings correct
4. **Test access** - No broken access
5. **Approve security improvements**

**Key Checks:**
- Security actually improved
- No new vulnerabilities
- Access still works
- Compliance maintained

## Best Practices

### Review Checklist

**Before Approving:**
- [ ] Visual diagram reviewed
- [ ] Security analysis passed
- [ ] Cost impact acceptable
- [ ] Dependencies correct
- [ ] Configuration valid
- [ ] No breaking changes
- [ ] Documentation updated

### Provide Constructive Feedback

**Good Feedback:**
- Specific issues identified
- Suggestions for improvement
- References to best practices
- Examples of better approaches

**Example:**
```
Good: "Storage account 'stg-new' allows public access. 
       Consider using private endpoints for security."

Bad: "This is wrong."
```

### Use Visual Evidence

**Include in Comments:**
- Screenshots of diagrams
- Highlighted issues
- Comparison views
- Visual explanations

**Benefits:**
- Clearer communication
- Faster understanding
- Better documentation
- Reduced back-and-forth

## Integration with CI/CD

### Automated Reviews

**GitHub Actions Example:**
```yaml
- name: Cloudeval Review
  run: |
    cloudeval review --template template.json
    # Comment on PR with findings
```

**Benefits:**
- Automatic reviews on every PR
- Consistent review process
- Catch issues early
- Reduce manual review time

### PR Comments

**Automatic PR Comments:**
- Security findings
- Cost impact summary
- Visual diagram links
- Change analysis

**Benefits:**
- Reviewers see findings immediately
- Visual context in PR
- Faster review process
- Better documentation

## Next Steps

- **[Security Audits](security-audits.md)** - Related use case
- **[Export & Share](../features/export.md)** - Share review findings
- **[Getting Started](../getting-started/overview.md)** - Learn the basics
- **[Architecture Planning](architecture-planning.md)** - Related use case

---

**Ready to improve your code reviews?** [Try Cloudeval now](https://cloudeval.ai/signup)
