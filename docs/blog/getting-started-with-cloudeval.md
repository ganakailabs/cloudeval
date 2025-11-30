# Getting Started with Cloudeval: A Beginner's Guide

**Published:** January 15, 2025  
**Author:** Cloudeval Team  
**Category:** Tutorials

## Introduction

Welcome to Cloudeval! If you're new to cloud evaluation and assessment, this guide will help you get started on the right foot. We'll walk you through the basics of setting up Cloudeval and running your first evaluation.

## What is Cloudeval?

Cloudeval is a comprehensive platform for evaluating and assessing cloud infrastructure. It helps you:

- Identify configuration issues before deployment
- Ensure compliance with best practices
- Optimize costs and resource utilization
- Maintain security standards across your cloud environment

## Prerequisites

Before you begin, make sure you have:

- Access to your cloud environment (Azure, AWS, or GCP)
- Appropriate permissions to read resource configurations
- Basic understanding of cloud infrastructure concepts

## Installation

### Step 1: Install Cloudeval

```bash
pip install Cloudeval
```

Or using conda:

```bash
conda install -c conda-forge Cloudeval
```

### Step 2: Verify Installation

```bash
cloudeval --version
```

You should see the version number displayed.

## Your First Evaluation

### Step 1: Configure Your Environment

Create a configuration file `cloudeval.yml`:

```yaml
cloud_provider: azure
subscription_id: your-subscription-id
evaluation_rules:
  - security
  - cost-optimization
  - reliability
```

### Step 2: Run Your First Evaluation

```bash
cloudeval evaluate --config Cloudeval.yml
```

### Step 3: Review Results

The evaluation will generate a report showing:

- ✅ Passed checks
- ⚠️ Warnings
- ❌ Failed checks with recommendations

## Understanding the Results

### Security Checks

Security evaluations check for:

- Publicly accessible resources
- Missing encryption
- Inadequate access controls
- Compliance violations

### Cost Optimization

Cost checks identify:

- Underutilized resources
- Over-provisioned instances
- Unused storage
- Optimization opportunities

### Reliability

Reliability checks ensure:

- High availability configurations
- Backup and disaster recovery
- Resource redundancy
- SLA compliance

## Next Steps

1. **Review Recommendations**: Address high-priority issues first
2. **Set Up Regular Evaluations**: Schedule weekly or monthly evaluations
3. **Customize Rules**: Configure custom rules for your organization
4. **Integrate with CI/CD**: Add evaluations to your deployment pipeline

## Common Issues and Solutions

### Issue: Permission Denied

**Solution**: Ensure your service principal or user account has the `Reader` role at the subscription level.

### Issue: No Resources Found

**Solution**: Verify your subscription ID and that resources exist in the specified region.

### Issue: Evaluation Timeout

**Solution**: For large environments, use resource filtering or evaluate specific resource groups.

## Conclusion

You're now ready to start evaluating your cloud infrastructure with Cloudeval! For more advanced topics, check out our [tutorials](tutorials.md) and [best practices](best-practices.md) guides.

## Resources

- [Installation Guide](../../getting-started/install.md)
<!-- - [API Reference](../../reference.md) -->
- [Contribution Guide](../../contribute.md)

---

Have questions? [Open an issue](https://github.com/ganakailabs/cloudeval/issues) or [start a discussion](https://github.com/ganakailabs/cloudeval/discussions)!
