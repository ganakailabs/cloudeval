# Export & Share Diagrams

**Share Your Infrastructure Diagrams in Any Format**

Export your Cloudeval diagrams to share with stakeholders, include in documentation, or use in presentations.

<video controls preload="metadata" style="min-width: 600px; max-width: 100%; height: auto; display: block; margin: 1.5rem auto;">
  <source src="../assets/videos/export.webm" type="video/webm">
  Your browser does not support the video tag.
</video>

## Export Formats

### PNG (Images)

**Best for:** Presentations, documentation, quick sharing

**Options:**

- Resolution: Standard (1920x1080) or High (3840x2160)
- Background: Transparent or white
- Include legend: Yes/No
- Include metadata: Resource names, tags

**How to Export:**

1. Click **Export** → **PNG**
2. Choose resolution and options
3. Click **Download**

### SVG (Vector Graphics)

**Best for:** Scalable graphics, web use, print

**Features:**

- Infinitely scalable
- Editable in vector editors
- Small file size
- Preserves text and shapes

**How to Export:**

1. Click **Export** → **SVG**
2. Choose options
3. Click **Download**

### Visio (VSDX)

**Best for:** Microsoft Visio users, enterprise documentation

**Features:**

- Native Visio format
- Editable shapes and connectors
- Preserves relationships
- Compatible with Visio 2013+

**How to Export:**

1. Click **Export** → **Visio**
2. Choose options
3. Click **Download**

### draw.io (XML)

**Best for:** draw.io users, collaborative editing

**Features:**

- Native draw.io format
- Editable in draw.io
- Preserves all diagram elements
- Can be imported back

**How to Export:**

1. Click **Export** → **draw.io**
2. Choose options
3. Click **Download**

### PDF (Documents)

**Best for:** Documentation, reports, printing

**Features:**

- Multi-page support
- Includes metadata
- Print-ready
- Searchable text

**How to Export:**

1. Click **Export** → **PDF**
2. Choose page size and options
3. Click **Download**

## Sharing Options

### Direct Link

Share a view-only link:

1. Click **Share** → **Get Link**
2. Choose permissions:
   - **View Only:** Can view but not edit
   - **Comment:** Can add comments
   - **Edit:** Full access (team members)
3. Copy link and share

**Link Features:**

- Works without login (view-only)
- Updates automatically
- Can be password protected
- Expires after set time (optional)

### Embed in Documentation

Embed diagrams in Confluence, Notion, or websites:

```html
<iframe
  src="https://cloudeval.ai/diagram/embed/PROJECT_ID"
  width="100%"
  height="600"
  frameborder="0"
>
</iframe>
```

### Email Export

Send diagram directly via email:

1. Click **Share** → **Email**
2. Enter recipient(s)
3. Choose format (PNG, PDF)
4. Add message
5. Click **Send**

## Export Best Practices

### For Presentations

- Use PNG at high resolution (3840x2160)
- Include legend for clarity
- Export with white background
- Remove sensitive information if needed

### For Documentation

- Use SVG for scalability
- Include resource names and metadata
- Export with transparent background
- Add custom annotations before export

### For Collaboration

- Use draw.io format for editing
- Share direct links for real-time updates
- Export PDF for offline review
- Include version information

### For Printing

- Use PDF format
- Choose appropriate page size
- Ensure high resolution
- Test print before large runs

## Customization Before Export

### Add Annotations

1. Click **Annotate** tool
2. Add text labels
3. Draw arrows or highlights
4. Add custom shapes

### Adjust Layout

1. Reposition nodes
2. Adjust spacing
3. Group related resources
4. Optimize for export size

### Filter Resources

1. Hide unnecessary resources
2. Focus on specific areas
3. Simplify complex views
4. Create multiple exports

## Export Settings

### Image Quality

- **Standard:** Good for web (1920x1080)
- **High:** Best for print (3840x2160)
- **Custom:** Set your own dimensions

### Background

- **Transparent:** For overlays
- **White:** For documents
- **Dark:** For presentations
- **Custom:** Your own color

### Metadata

- **Resource Names:** Include/exclude
- **Tags:** Show/hide
- **Costs:** Include/exclude
- **Custom Fields:** Your choice

## Automation

### Scheduled Exports

Set up automatic exports:

1. Go to **Settings** → **Automation**
2. Create export schedule
3. Choose format and destination
4. Configure email notifications

**Use Cases:**

- Weekly infrastructure reports
- Monthly cost summaries
- Change documentation
- Compliance reports

### API Exports

Export via API for automation:

```bash
curl -X POST https://api.cloudeval.ai/v1/projects/PROJECT_ID/export \
  -H "Authorization: Bearer ${CLOUDEVAL_API_TOKEN}" \
  -H "Content-Type: application/json" \
  -d '{
    "format": "png",
    "resolution": "high",
    "options": {
      "include_legend": true,
      "background": "white"
    }
  }'
```

## Security Considerations

### Sensitive Information

Before exporting:

- Review for sensitive data
- Remove internal IPs if needed
- Hide resource IDs if required
- Sanitize resource names

### Access Control

- Set appropriate sharing permissions
- Use password protection for links
- Set expiration dates
- Monitor access logs

## Troubleshooting

### Export Fails

**Problem:** Export doesn't complete

**Solutions:**

- Check diagram size (very large diagrams may timeout)
- Try different format
- Reduce resolution
- Contact support

### Poor Quality

**Problem:** Exported image is blurry

**Solutions:**

- Use higher resolution
- Export as SVG instead
- Check zoom level before export
- Use PDF for documents

### Missing Elements

**Problem:** Some resources don't appear in export

**Solutions:**

- Ensure resources are visible in diagram
- Check filters aren't hiding resources
- Refresh diagram before export
- Try different format

## Next Steps

- **[Collaborate on Diagrams](collaboration.md)** - Share with team
- **[Customize Diagrams](../tutorials/customize-diagrams.md)** - Make them perfect
- **[Use AI Chat](../getting-started/ai-chat.md)** - Get insights before export

---

**Need help?** [Contact support](../support.md)
