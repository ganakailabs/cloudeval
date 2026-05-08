# Security Audits

**Use Cloudeval to Conduct Comprehensive Security Audits of Your Infrastructure**

Cloudeval helps security teams and DevOps engineers quickly visualize and audit infrastructure code to identify security vulnerabilities, compliance gaps, and best practice violations before deployment.

## Use Case Overview

**Who:** Security teams, DevOps engineers, compliance officers

**When:** 
- Before deploying new infrastructure
- During security reviews
- For compliance audits
- After security incidents
- Regular security assessments

**Why:** Quickly identify security issues in Infrastructure as Code before they reach production

## Workflow

### Step 1: Upload Infrastructure as Code

1. **Upload an ARM template** to Cloudeval
2. **Review parsed resources** - Ensure all resources are detected
3. **Verify template structure** - Check for parsing errors

### Step 2: Run Security Analysis

1. **Open Security Analysis panel**
2. **Review automatic findings** - Cloudeval scans for:
   - Publicly accessible resources
   - Missing encryption
   - Inadequate access controls
   - Network security gaps
   - Compliance violations
3. **Categorize issues** by severity (Critical, High, Medium, Low)

### Step 3: Visualize Security Posture

1. **View diagram** with security annotations
2. **Identify vulnerable resources** highlighted in diagram
3. **Understand relationships** - See how resources connect
4. **Map attack surfaces** - Visualize potential entry points

### Step 4: Investigate Issues

1. **Click on security warnings** to see details
2. **Review recommendations** for each issue
3. **Understand impact** - See affected resources
4. **Prioritize fixes** - Focus on critical issues first

### Step 5: Fix and Verify

1. **Edit code** in the web editor
2. **Apply security fixes** based on recommendations
3. **Re-analyze** to verify fixes
4. **Document changes** - Note security improvements

### Step 6: Generate Audit Report

1. **Export Security Report** (PDF, JSON, CSV)
2. **Include findings** with severity and recommendations
3. **Share with stakeholders** - Security team, management
4. **Track remediation** - Follow up on fixes

## Common Security Checks

### Public Access Audits

**Check for:**
- Storage accounts with public blob access
- Databases with public endpoints
- Load balancers exposed to internet
- App Services with public access
- Key Vaults with public network access

**Example:**
```
Issue: Storage account 'stg-public-data' allows public blob access
Severity: High
Impact: Unauthorized access to sensitive data
Fix: Set publicAccess to 'None' or use private endpoints
```

### Encryption Audits

**Check for:**
- Unencrypted storage accounts
- Databases without encryption at rest
- Missing encryption for data transfers
- Unencrypted backup storage

**Example:**
```
Issue: SQL Database 'db-customer-data' missing encryption at rest
Severity: Critical
Impact: Data exposure if storage is compromised
Fix: Enable Transparent Data Encryption (TDE)
```

### Access Control Audits

**Check for:**
- Overly permissive IAM roles
- Missing least-privilege principles
- Public contributor access
- Unrestricted network access

**Example:**
```
Issue: Role assignment grants 'Owner' to all users in subscription
Severity: Critical
Impact: Unauthorized resource modifications
Fix: Use least-privilege roles (Reader, specific permissions)
```

### Network Security Audits

**Check for:**
- Overly permissive NSG rules
- Missing network isolation
- Public endpoints without restrictions
- Insecure network configurations

**Example:**
```
Issue: NSG allows RDP (port 3389) from any source (0.0.0.0/0)
Severity: High
Impact: Potential unauthorized remote access
Fix: Restrict to specific IP ranges or use VPN
```

### Compliance Audits

**Check against:**
- Azure Security Benchmark
- CIS Azure Foundations Benchmark
- NIST Cybersecurity Framework
- PCI DSS (when applicable)
- HIPAA (when applicable)

**Example:**
```
Issue: Missing diagnostic logs for Key Vault
Standard: Azure Security Benchmark
Impact: Cannot audit access to secrets
Fix: Enable diagnostic settings for audit logging
```

## Best Practices

### Regular Audits

- **Before Deployment** - Always audit before deploying to production
- **Scheduled Reviews** - Conduct monthly or quarterly audits
- **After Changes** - Re-audit after significant infrastructure changes
- **Incident Response** - Audit after security incidents

### Prioritization

Focus on:

1. **Critical Issues** - Fix immediately (encryption, public access)
2. **High Issues** - Address before deployment (access controls)
3. **Medium Issues** - Plan fixes (compliance, best practices)
4. **Low Issues** - Consider improvements (optimization)

### Documentation

- **Document Findings** - Keep audit reports for compliance
- **Track Remediation** - Follow up on fixes
- **Share Results** - Communicate findings to stakeholders
- **Learn from Issues** - Update processes to prevent recurrence

## Example Audit Scenario

### Scenario: Pre-Production Security Review

**Context:** New infrastructure being deployed to production

**Steps:**

1. **Upload production template** to Cloudeval
2. **Run security analysis** - Identifies 12 issues:
   - 2 Critical (missing encryption)
   - 5 High (public access, permissive roles)
   - 4 Medium (compliance gaps)
   - 1 Low (optimization)

3. **Review findings** with security team
4. **Prioritize fixes** - Address critical and high issues
5. **Fix in code** - Apply security improvements
6. **Re-analyze** - Verify all critical/high issues resolved
7. **Generate report** - Document audit and fixes
8. **Deploy** - Proceed with deployment after fixes

**Result:** Security issues identified and fixed before production deployment

## Integration with CI/CD

### Automated Security Checks

Integrate Cloudeval security analysis into CI/CD:

```yaml
# Example GitHub Actions workflow
- name: Security Analysis
  run: |
    cloudeval analyze security --template template.json
    # Fail build if critical issues found
```

### Pre-Deployment Gates

- **Block deployment** if critical issues found
- **Warn on high issues** - Require approval
- **Report medium/low** - Log for review
- **Track over time** - Monitor security trends

## Next Steps

- **[Security Analysis Feature](../features/security-analysis.md)** - Learn about security features
- **[Export & Share](../features/export.md)** - Share audit reports
- **[Getting Started](../getting-started/overview.md)** - Learn the basics
- **[Infrastructure Onboarding](infrastructure-onboarding.md)** - Related use case

---

**Ready to audit your infrastructure?** [Try Cloudeval now](https://cloudeval.ai/signup)
