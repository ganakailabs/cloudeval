# Cloudeval CLI

The Cloudeval CLI lets you authenticate, select a project, and ask Eva questions from your terminal. Use it for local workflows, scripts, and CI/CD jobs where a browser-based chat is too slow or hard to automate.

## Quick Start

### Installation

**npm install (Node.js 20+):**

```bash
npm install -g @ganakailabs/cloudeval-cli
```

**Standalone release binary:**

```bash
curl -fsSL https://cli.cloudeval.ai/install.sh | bash
```

This installs the `cloudeval` command globally.

**Verify installation:**

```bash
cloudeval --version
```

### First Steps

1. **Login to your account:**

```bash
cloudeval login
```

This will:
- Open your browser for authentication
- Use Azure AD device code flow
- Save your authentication token locally

2. **Start chatting:**

```bash
cloudeval chat
```

The CLI will:
- Automatically authenticate if needed
- Fetch your projects from the backend
- Auto-select your "Playground" project (or show a selector if you have multiple projects)
- Start an interactive chat session with Eva, your AI assistant

## Commands

### `cloudeval chat`

Start an interactive chat session with your infrastructure.

**Basic usage:**

```bash
cloudeval chat
```

**Options:**

- `--base-url <url>` - Backend base URL (default: `https://cloudeval.ai/api/proxy/v1`, or `CLOUDEVAL_BASE_URL` when set)
- `--api-key <key>` - API key for machine workflows
- `--api-key-stdin` - Read API key from stdin for safer automation
- `--machine` - Allow machine credential fallback
- `--conversation <id>` - Resume a specific conversation/thread
- `--continue` - Resume the most recent local chat session
- `--resume <id-or-title>` - Resume a local chat session by thread ID or title
- `--model <name>` - Specify the AI model to use
- `--debug` - Enable debug logging (shows raw chunks)
- `--health-check` - Enable backend health check (disabled by default)
- `--no-banner` - Disable ASCII banner
- `--no-anim` - Disable loader animations

**Examples:**

```bash
# Chat with default settings
cloudeval chat

# Chat with a custom backend
cloudeval chat --base-url http://localhost:8000/api/v1

# Resume a previous conversation
cloudeval chat --conversation abc123

# Use a specific model
cloudeval chat --model gpt-4

# Debug mode
cloudeval chat --debug
```

### `cloudeval ask`

Ask a single question non-interactively (perfect for scripts and automation).

**Basic usage:**

```bash
cloudeval ask "What resources are in my infrastructure?"
```

**Options:**

- `--base-url <url>` - Backend base URL (default: `https://cloudeval.ai/api/proxy/v1`, or `CLOUDEVAL_BASE_URL` when set)
- `--api-key <key>` - API key for machine workflows
- `--api-key-stdin` - Read API key from stdin for safer automation
- `--machine` - Allow machine credential fallback
- `--project <id>` - Project ID to use (default: auto-selects Playground project)
- `--model <name>` - Specify the AI model to use
- `--thread <id>` - Reuse a specific thread ID
- `--output <file>` - Write response to file (default: stdout)
- `--format <format>` - Output format: `text`, `json`, `ndjson`, or `markdown`
- `--json` - Output as JSON
- `--progress <mode>` - Progress events: `auto`, `stderr`, `ndjson`, or `none`
- `--quiet` - Suppress progress and warning messages
- `--open` / `--print-url` / `--no-open` - Control frontend chat-thread links
- `--debug` - Enable debug logging (shows raw chunks)

**Examples:**

```bash
# Ask a question (outputs to stdout)
cloudeval ask "How many virtual machines are in my infrastructure?"

# Save response to file
cloudeval ask "Generate a cost report" --output response.txt

# Output as JSON
cloudeval ask "What resources are in my infrastructure?" --format json

# Use specific project
cloudeval ask "What's the architecture?" --project abc123

# Use in scripts
RESPONSE=$(cloudeval ask "List all storage accounts")
echo "$RESPONSE"
```

### `cloudeval login`

Authenticate with Cloudeval using Azure AD device code flow.

```bash
cloudeval login
```

This command:
- Opens a browser for authentication
- Displays a device code you can enter
- Saves your authentication token locally
- Supports token refresh automatically

**Note:** If you run `cloudeval chat` without being authenticated, it will automatically prompt you to login.

### `cloudeval logout`

Clear your authentication tokens.

```bash
cloudeval logout
```

This removes:
- Stored authentication tokens
- Refresh tokens
- Local configuration

### `cloudeval banner`

Preview the startup banner and terminal capabilities.

```bash
cloudeval banner
```

## Features

### Automatic Authentication

The CLI automatically handles authentication:

- **First run:** Automatically triggers login flow if not authenticated
- **Token refresh:** Automatically refreshes expired tokens
- **Token storage:** Securely stores tokens in `~/.config/cloudeval/config.json`

### Project Selection

The CLI intelligently manages projects:

- **Auto-fetch:** Automatically fetches your projects from the backend
- **Auto-select Playground:** Automatically selects your "Playground" project if it exists
- **Multiple projects:** Shows an interactive selector if you have multiple projects
- **Project context:** All chat messages are sent with your selected project context

### Interactive Chat Interface

The CLI provides a rich terminal UI:

- **Thread view:** See your conversation history with Eva
- **Real-time streaming:** Watch responses stream in real-time
- **Thinking steps:** See Eva's reasoning process as she thinks
- **Scrollable history:** Navigate through long conversations
- **Keyboard shortcuts:** Efficient navigation and control

### Keyboard Shortcuts

**Scrolling:**
- `Ctrl+↑/↓` - Scroll up/down (works even when input is focused)
- `↑/↓` - Scroll up/down (when input is not focused)
- `Page Up/Down` - Scroll by page
- `Ctrl+H` - Scroll to top
- `Ctrl+E` - Scroll to bottom

**Chat:**
- `Enter` - Send message
- `Shift+Enter` - New line in message
- `Ctrl+L` - Clear chat history
- `Ctrl+C` - Exit CLI
- `Escape` - Cancel streaming request

## Configuration

### Environment Variables

You can configure the CLI using environment variables:

```bash
# Backend URL
export CLOUDEVAL_BASE_URL="https://cloudeval.ai/api/proxy/v1"

# API key for machine workflows
export CLOUDEVAL_API_KEY="your-api-key"

# Backend authentication (for custom deployments)
export CLOUDEVAL_BACKEND_CLIENT_ID="your-client-id"
export CLOUDEVAL_BACKEND_TENANT_ID="your-tenant-id"
export CLOUDEVAL_BACKEND_SCOPE="api://your-client-id/access_as_user offline_access"

# Disable features
export CLOUDEVAL_NO_BANNER=1  # Disable banner
export CLOUDEVAL_NO_ANIM=1    # Disable animations
```

### Configuration Files

Authentication tokens are stored in:
- **Location:** `~/.config/cloudeval/config.json`
- **Format:** JSON with `token`, `tokenExpiresAt`, and `refreshToken`

Projects are cached in:
- **Location:** `~/.config/cloudeval/projects.json`
- **Format:** JSON array of project objects

## Usage Examples

### Basic Chat Session

```bash
# Start a chat session
cloudeval chat

# The CLI will:
# 1. Authenticate (if needed)
# 2. Fetch your projects
# 3. Select Playground project
# 4. Start chat interface

# Type your question:
> How many virtual machines are in my infrastructure?

# Eva responds with real-time streaming
```

### Using with API Key

For CI/CD or automation:

```bash
# Set API key
export CLOUDEVAL_API_KEY="your-api-key"

# Interactive chat
cloudeval chat

# Non-interactive (better for automation)
cloudeval ask "What resources are in my infrastructure?"
```

### Resuming Conversations

```bash
# Start a new conversation
cloudeval chat

# Note the conversation ID from the UI
# Resume it later:
cloudeval chat --conversation abc123def456

# Or continue the most recent local session
cloudeval chat --continue
```

### Custom Backend

For self-hosted or development:

```bash
cloudeval chat --base-url http://localhost:8000/api/v1
```

## Troubleshooting

### Authentication Issues

**Problem:** "No authentication available"

**Solution:**
```bash
cloudeval login
```

**Problem:** Token expired

**Solution:** The CLI automatically refreshes tokens. If it fails:
```bash
cloudeval logout
cloudeval login
```

### Connection Issues

**Problem:** "Backend health check failed"

**Solutions:**
- Check if backend is running: `curl http://localhost:8000/api/v1/chat/health`
- Use `--health-check` only when you want the CLI to run the backend health check before chat
- Verify `CLOUDEVAL_BASE_URL` is correct

### Project Selection Issues

**Problem:** No projects found

**Solution:**
- Ensure you've completed onboarding in the web UI
- Check that you have at least one project created
- Verify authentication is working: `cloudeval login`

### Build from Source

If you want to build the CLI from source:

```bash
# Clone the repository
git clone https://github.com/ganakailabs/cloudeval-cli.git
cd cloudeval-cli

# Install dependencies
pnpm install

# Build the CLI
pnpm --filter cloudeval-cli build:executable

# Run the executable
./packages/cli/dist/bin/cloudeval chat
```

## Advanced Usage

### Docker

Run the CLI in Docker:

```bash
# Build Docker image
docker build -t cloudeval-cli -f packages/cli/Dockerfile .

# Run CLI
docker run -it --rm cloudeval-cli chat
```

### CI/CD Integration

Example GitHub Actions workflow:

```yaml
name: Infrastructure Chat

on:
  workflow_dispatch:
    inputs:
      question:
        description: 'Question to ask Eva'
        required: true

jobs:
  chat:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      
      - name: Install Cloudeval CLI
        run: |
          npm install -g @ganakailabs/cloudeval-cli
      
      - name: Ask Question (Non-Interactive)
        run: |
          printf '%s' "${{ secrets.CLOUDEVAL_API_KEY }}" | cloudeval ask "${{ inputs.question }}" \
            --api-key-stdin \
            --output response.txt
      
      - name: Upload Response
        uses: actions/upload-artifact@v3
        with:
          name: chat-response
          path: response.txt
```

## What's Next?

- **[AI Chat Tutorial](../tutorials/ai-chat-basics.md)** - Learn advanced chat features
- **[Getting Started Overview](overview.md)** - Complete platform guide
- **[Features](../features/index.md)** - Explore all Cloudeval capabilities

## Support

Need help with the CLI?

- **[FAQ](../faq.md)** - Common questions and answers
- **[GitHub Issues](https://github.com/ganakailabs/cloudeval-cli/issues)** - Report bugs
- **[Discord](https://discord.com/channels/1442249998052884542/1442250002549313660)** - Community support

---

**Ready to start?** Run `cloudeval chat` and begin chatting with your infrastructure!
