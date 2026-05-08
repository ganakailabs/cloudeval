# Web IaC Editor

**Edit Your Infrastructure as Code Directly in the Browser**

Cloudeval's built-in web editor lets you edit ARM templates directly in your browser with syntax highlighting, auto-completion, error detection, and real-time diagram updates. Bicep editor support is listed on the roadmap.

## Overview

The Web IaC Editor provides:

- **Syntax Highlighting** - Color-coded ARM and Bicep syntax
- **Auto-Completion** - Intelligent code completion
- **Error Detection** - Real-time validation and error highlighting
- **Multi-File Support** - Edit multiple files in tabs
- **Real-Time Updates** - See diagram changes as you edit
- **Format & Validate** - Format code and validate templates
- **Export Changes** - Download updated files

## Features

### Syntax Highlighting

Full syntax highlighting for:

- **ARM Templates** - JSON syntax with ARM-specific highlighting (Available now)
- **Bicep Files** - Planned ([View roadmap](https://cloudeval.ai/home/roadmap))
- **Parameter Files** - Parameter-specific syntax
- **Linked Templates** - Template reference highlighting

**Highlights:**
- Resource types and properties
- Functions and expressions
- Parameters and variables
- Comments and documentation
- Strings, numbers, and booleans

### Auto-Completion

Intelligent code completion:

**For ARM Templates:**
- Resource types and API versions
- Property names and values
- Template functions
- Parameter references
- Variable references

**For Bicep Files:**
- Resource declarations
- Module references
- Built-in functions
- Decorators and metadata
- Output definitions

**Trigger:** Press `Ctrl+Space` (or `Cmd+Space` on Mac) for suggestions

### Error Detection

Real-time validation:

**Detects:**
- Syntax errors (JSON, Bicep)
- Missing required properties
- Invalid resource configurations
- Type mismatches
- Reference errors

**Error Display:**
- Red squiggly lines under errors
- Error messages on hover
- Error list in panel
- Quick fixes for common issues

### Multi-File Editing

Edit multiple files simultaneously:

**Features:**
- Tabbed interface for multiple files
- Switch between files easily
- See all open files
- Save all or individual files
- Close tabs individually

**Supported:**
- Main templates
- Linked templates
- Parameter files
- Module files (Bicep)

### Real-Time Diagram Updates

See changes instantly:

1. **Edit code** in the editor
2. **Save changes** (auto-save or manual)
3. **Diagram updates** automatically
4. **View changes** in real-time

**Update Modes:**
- **Auto** - Updates on save
- **Manual** - Click "Refresh Diagram"
- **Live** - Updates as you type (optional)

### Format & Validate

Built-in formatting and validation:

**Format Code:**
- Auto-format JSON (ARM templates)
- Format Bicep files when support is available
- Indentation and spacing
- Consistent style

**Validate Templates:**
- Check syntax
- Validate resource properties
- Verify parameter types
- Check references

**Commands:**
- `Shift+Alt+F` - Format document
- `Ctrl+Shift+P` - Command palette
- "Format Document" - Format current file
- "Validate Template" - Run validation

## Using the Editor

### Opening the Editor

1. **Upload a template** or open existing project
2. **Click "Edit Code"** button
3. **Editor opens** in split view or full screen
4. **Start editing** your Infrastructure as Code

### Editing Code

**Basic Editing:**
- Type to add code
- Use standard shortcuts (Ctrl+C, Ctrl+V, etc.)
- Undo/Redo with Ctrl+Z / Ctrl+Y
- Find/Replace with Ctrl+F

**Advanced Features:**
- Multi-cursor editing (Alt+Click)
- Column selection (Shift+Alt+Drag)
- Go to line (Ctrl+G)
- Go to symbol (Ctrl+Shift+O)

### Saving Changes

**Save Options:**
- **Auto-Save** - Automatically saves as you type
- **Manual Save** - Ctrl+S to save
- **Save All** - Save all open files
- **Save As** - Save with new name

**After Saving:**
- Changes are applied to diagram
- Validation runs automatically
- Errors are highlighted
- Success notification appears

### Exporting Changes

Download updated files:

1. **Make changes** in editor
2. **Save changes**
3. **Click "Export"** or "Download"
4. **Choose files** to download
5. **Files download** to your computer

## Editor Shortcuts

### Navigation

- `Ctrl+G` - Go to line
- `Ctrl+P` - Quick open file
- `Ctrl+Shift+O` - Go to symbol
- `F12` - Go to definition
- `Shift+F12` - Find all references

### Editing

- `Ctrl+Space` - Trigger auto-completion
- `Shift+Alt+F` - Format document
- `Ctrl+/` - Toggle line comment
- `Shift+Alt+A` - Toggle block comment
- `Alt+Up/Down` - Move line up/down

### Selection

- `Ctrl+D` - Select next occurrence
- `Ctrl+Shift+L` - Select all occurrences
- `Alt+Click` - Add cursor
- `Ctrl+Alt+Up/Down` - Add cursor above/below

### View

- `Ctrl+B` - Toggle sidebar
- `Ctrl+\` - Split editor
- `F11` - Toggle full screen
- `Ctrl+` - Zoom in
- `Ctrl-` - Zoom out

## Best Practices

### Code Organization

- **Use Comments** - Document complex logic
- **Consistent Formatting** - Use format command regularly
- **Modular Structure** - Break into linked templates/modules
- **Clear Naming** - Use descriptive names

### Validation

- **Validate Often** - Check for errors frequently
- **Fix Errors First** - Address errors before continuing
- **Test Changes** - Verify diagram updates correctly
- **Review Before Export** - Double-check before downloading

### Collaboration

- **Use Comments** - Add comments for team members
- **Version Control** - Export and commit changes
- **Share Changes** - Use collaboration features
- **Document Changes** - Note what changed and why

## Limitations

### Current Limitations

- **Browser-Based** - Requires internet connection
- **File Size** - Very large files may be slow
- **Offline Mode** - Limited offline functionality
- **Advanced Features** - Some IDE features not available

### Coming Soon

- **Offline Editing** - Full offline support
- **Git Integration** - Direct Git commit/push
- **Advanced Refactoring** - Code refactoring tools
- **Custom Snippets** - User-defined code snippets

## Troubleshooting

### Editor Won't Open

**Problem:** Editor doesn't open when clicking "Edit Code"

**Solutions:**
- Refresh the page
- Check browser console for errors
- Try different browser
- Clear browser cache

### Auto-Completion Not Working

**Problem:** Code completion doesn't appear

**Solutions:**
- Press `Ctrl+Space` manually
- Check if language is detected correctly
- Verify file extension (.json, .bicep)
- Refresh editor

### Changes Not Saving

**Problem:** Changes are lost after refresh

**Solutions:**
- Enable auto-save
- Manually save with Ctrl+S
- Check browser storage permissions
- Export changes before closing

### Diagram Not Updating

**Problem:** Diagram doesn't reflect code changes

**Solutions:**
- Save the file (Ctrl+S)
- Click "Refresh Diagram"
- Check for syntax errors
- Validate template

## Next Steps

- **[Getting Started](../getting-started/overview.md)** - Learn the basics
- **[ARM Templates](../tutorials/arm-templates.md)** - ARM template guide
- **[Bicep Files](../tutorials/bicep-files.md)** - Bicep file guide
- **[Export & Share](export.md)** - Share your changes

---

**Need help?** [Contact support](../support.md) or [join our community](../community.md)
