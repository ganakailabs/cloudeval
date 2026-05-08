# Generate Your First Diagram

This guide shows the fastest current path to a useful Cloudeval diagram: upload an Infrastructure as Code file, wait for Cloudeval to parse it, then inspect the generated resources and relationships.

## Before You Start

You need:

- A Cloudeval account, or access to the [Playground](https://cloudeval.ai/playground)
- An Azure ARM template (`.json`)
- Optional parameter or linked template files if your deployment uses them

!!! warning "Direct cloud import is coming soon"
    Direct Azure and AWS cloud import is documented as a roadmap feature elsewhere in these docs. Use ARM template uploads for the current workflow.

## Quick Start

1. Click **New Project** in the dashboard.
2. Enter a project name, such as `Production infrastructure`.
3. Choose **Upload File**.
4. Select your ARM template and any linked files.
5. Click **Create Project**.
6. Wait for Cloudeval to parse the template and generate the diagram.

## What Happens During Generation

Cloudeval turns the uploaded template into a diagram in four stages:

1. **Parse the template** - Reads JSON, parameters, variables, linked templates, and outputs.
2. **Discover resources** - Identifies Azure resource definitions.
3. **Map relationships** - Detects dependencies, references, and connections.
4. **Render the diagram** - Lays out resources so you can inspect and navigate them.

Generation time depends on template size and dependency complexity. Small templates usually complete faster than large, modular deployments.

## Explore the Diagram

### Navigate

- **Pan:** Click and drag the canvas.
- **Zoom:** Use the mouse wheel or pinch gesture.
- **Fit to screen:** Double-click the canvas.
- **Select:** Click a resource to open details.
- **Search:** Use `Ctrl+K` or `Cmd+K` to find resources.

### Inspect Resources

Click any resource node to review:

- Resource type and API version
- Properties from the template
- Parameters and variables used by the resource
- Direct dependencies and dependents
- Outputs, if the template defines them

### Reduce Clutter

For larger templates:

- Filter by resource type or area.
- Group related resources.
- Collapse groups when you only need the high-level view.
- Create multiple focused views instead of one overloaded diagram.

## Customize the View

Use the layout and styling controls when the default diagram is too dense or when you are preparing a diagram for review:

- **Automatic layout:** Best first view for most templates.
- **Manual layout:** Drag nodes into a presentation-ready arrangement.
- **Hierarchical layout:** Show dependency direction more clearly.
- **Security or cost overlays:** Highlight specific review concerns when available.

## Common Issues

### Empty Diagram

If the diagram shows no resources:

- Confirm the template has a `resources` array.
- Validate the JSON before uploading.
- Upload linked templates if the main template references them.
- Check that filters are not hiding resources.

### Missing Resources

If only some resources appear:

- Confirm conditional resources are included for the selected parameters.
- Check linked template paths.
- Make sure resource definitions are complete.
- Re-upload the latest files if you edited locally.

### Slow Generation

If generation takes longer than expected:

- Break very large deployments into smaller modules.
- Start with one resource group or service area.
- Remove unused linked templates.
- Contact support if a production-scale template consistently times out.

## Next Steps

1. **[Use AI Chat](../tutorials/ai-chat-basics.md)** - Ask questions about the generated diagram.
2. **[Customize the Layout](../tutorials/customize-diagrams.md)** - Prepare a cleaner review view.
3. **[Export the Diagram](../features/export.md)** - Share with your team.
4. **[Collaborate on Diagrams](../features/collaboration.md)** - Invite teammates.
