# Security Analysis

!!! warning "Coming Soon"
Advanced security analysis with detailed vulnerability scanning and compliance checks is listed on the roadmap as part of the "Deeper AI Understanding & Cloud Insight" release area.

    Currently, Cloudeval provides **interactive visualizations with security overlays** as part of the core platform. For advanced security analysis features, [view our roadmap](https://cloudeval.ai/home/roadmap).

    **[Join our waitlist](https://cloudeval.ai/waitlist)** to be notified when this feature launches.

**Automatically Identify Security Issues in Your Infrastructure as Code**

Cloudeval's AI-powered security analysis will scan your Infrastructure as Code to identify potential security vulnerabilities, compliance issues, and best practice violations before deployment.

## Overview

Security Analysis automatically reviews your Infrastructure as Code for:

- **Publicly accessible resources** - Resources exposed to the internet
- **Missing encryption** - Unencrypted storage, databases, and data
- **Inadequate access controls** - Overly permissive IAM roles and policies
- **Compliance violations** - Deviations from security standards
- **Network security gaps** - Misconfigured network security groups
- **Parameter security** - Exposed secrets or sensitive parameters

## How It Works

### Automatic Scanning

When you upload or edit your Infrastructure as Code:

1. **Parse & Analyze** - Cloudeval parses your ARM template
2. **Security Checks** - Runs automated security checks against best practices
3. **Issue Detection** - Identifies potential vulnerabilities and misconfigurations
4. **Risk Assessment** - Categorizes issues by severity (Critical, High, Medium, Low)
5. **Recommendations** - Provides specific remediation guidance

### Real-Time Analysis

Security analysis runs automatically:

- **On Upload** - When you first upload a template
- **On Edit** - When you modify code in the web editor
- **On Save** - When you save changes
- **On Demand** - Manual trigger via "Analyze Security" button

## Security Checks

### Public Access

Identifies resources that are publicly accessible:

**Checks for:**

- Storage accounts with public blob access
- Databases with public endpoints
- Load balancers with public IPs
- App Services with public access
- Key Vaults with public network access

**Example Warning:**

```
Security Issue: Storage account 'stg-public' has public blob access enabled
   Risk: High - Unauthorized access to storage data
   Recommendation: Set publicAccess to 'None' or use private endpoints
```

### Encryption

Detects missing encryption configurations:

**Checks for:**

- Unencrypted storage accounts
- Databases without encryption at rest
- Unencrypted data transfers
- Missing encryption keys

**Example Warning:**

```
Security Issue: SQL Database 'db-production' missing encryption at rest
   Risk: Critical - Data exposure risk
   Recommendation: Enable Transparent Data Encryption (TDE)
```

### Access Controls

Reviews IAM and RBAC configurations:

**Checks for:**

- Overly permissive role assignments
- Missing least-privilege principles
- Public contributor access
- Unrestricted network access

**Example Warning:**

```
Security Issue: Role assignment grants 'Contributor' to all users
   Risk: High - Unauthorized resource modifications
   Recommendation: Use least-privilege roles (Reader, specific permissions)
```

### Network Security

Analyzes network security group rules:

**Checks for:**

- Overly permissive NSG rules
- Missing network isolation
- Public endpoints without restrictions
- Insecure network configurations

**Example Warning:**

```
Security Issue: NSG allows SSH (port 22) from any source (0.0.0.0/0)
   Risk: High - Potential unauthorized access
   Recommendation: Restrict to specific IP ranges or use VPN
```

### Compliance

Checks against common compliance standards:

**Standards:**

- Azure Security Benchmark
- CIS Azure Foundations Benchmark
- NIST Cybersecurity Framework
- PCI DSS (when applicable)
- HIPAA (when applicable)

**Example Warning:**

```
Compliance Issue: Missing diagnostic logs for Key Vault
   Standard: Azure Security Benchmark
   Recommendation: Enable diagnostic settings for audit logging
```

### Parameter Security

Identifies security risks in parameters:

**Checks for:**

- Secrets in parameter defaults
- Exposed connection strings
- Hardcoded credentials
- Sensitive data in outputs

**Example Warning:**

```
Security Issue: Parameter 'adminPassword' has default value
   Risk: Medium - Potential credential exposure
   Recommendation: Remove default, use Key Vault references
```

## Using Security Analysis

### View Security Issues

1. **Upload or open** your Infrastructure as Code
2. **Security panel** appears automatically on the right
3. **Review issues** organized by severity
4. **Click an issue** to see details and recommendations

### Filter Issues

Filter security issues by:

- **Severity** - Critical, High, Medium, Low
- **Category** - Access, Encryption, Network, Compliance
- **Resource Type** - Storage, Database, Network, etc.
- **Status** - New, Acknowledged, Fixed

### Fix Issues

1. **Click an issue** to see the affected resource
2. **View recommendation** with specific guidance
3. **Edit code** directly in the web editor
4. **Re-analyze** to verify the fix

### Export Security Report

Generate a security report:

1. Click **Export** → **Security Report**
2. Choose format (PDF, JSON, CSV)
3. Include:
   - All issues with severity
   - Recommendations
   - Compliance status
   - Risk summary

## Best Practices

### Regular Security Reviews

- **Before Deployment** - Always review security issues before deploying
- **After Changes** - Re-analyze after significant infrastructure changes
- **Scheduled Reviews** - Set up regular security audits
- **Compliance Checks** - Verify compliance before audits

### Prioritize Critical Issues

Focus on:

1. **Critical** - Fix immediately (encryption, public access)
2. **High** - Address before deployment (access controls, network)
3. **Medium** - Plan fixes (compliance, best practices)
4. **Low** - Consider improvements (optimization, documentation)

### Use Security Analysis in CI/CD

Integrate security checks:

```yaml
# Example GitHub Actions workflow
- name: Security Analysis
  run: |
    cloudeval analyze security --template template.json
    # Fail build if critical issues found
```

## Limitations

### Current Limitations

- **Azure Only** - Currently documented for Azure Infrastructure as Code
- **Static Analysis** - Analyzes code, not running infrastructure
- **Best Practices** - Based on common security standards
- **False Positives** - Some warnings may be intentional

### Coming Soon

- **Multi-Cloud Support** - AWS, GCP security analysis
- **Runtime Analysis** - Compare code vs. actual infrastructure
- **Custom Rules** - Define organization-specific security rules
- **Integration** - Direct integration with Azure Security Center

## Troubleshooting

### No Issues Detected

**Problem:** Security analysis shows no issues, but you know there are problems

**Solutions:**

- Verify template is correctly parsed
- Check if issues are in linked templates
- Ensure all files are uploaded
- Review security check coverage

### Too Many False Positives

**Problem:** Many warnings that aren't actual issues

**Solutions:**

- Acknowledge intentional configurations
- Review and adjust severity
- Provide context in code comments
- Use custom rules (coming soon)

### Analysis Takes Too Long

**Problem:** Security analysis is slow for large templates

**Solutions:**

- Break templates into smaller modules
- Analyze specific sections
- Use incremental analysis
- Contact support for optimization

## Next Steps

- **[Cost Optimization](cost-optimization.md)** - Optimize infrastructure costs
- **[Export & Share](export.md)** - Share security reports
- **[Collaboration](collaboration.md)** - Review security with team
- **[Getting Started](../getting-started/overview.md)** - Learn the basics

---

**Need help?** [Contact support](../support.md) or [join our community](../community.md)
