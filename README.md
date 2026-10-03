# OpenAI Tunnel Client for Home Assistant OS

This repository provides an AMD64 Home Assistant add-on that runs OpenAI's
Secure MCP Tunnel client (`v0.0.15`). It keeps the Home Assistant MCP endpoint
private while the client makes an outbound connection to OpenAI.

## Installation

1. In Home Assistant, open **Settings → Add-ons → Add-on Store → ⋮ → Repositories**.
2. Add this repository URL.
3. Install **OpenAI Tunnel Client**.
4. Configure:
   - `tunnel_id`: the OpenAI Secure MCP Tunnel ID.
   - `control_plane_api_key`: an OpenAI runtime API key with **Tunnels Read + Use**.
   - `mcp_server_url`: your private Home Assistant MCP endpoint.
   - `mcp_access_token`: the bearer token accepted by that endpoint.
5. Start the add-on and verify its log reports a healthy, ready tunnel client.

## Security

No secrets are stored in this repository. Home Assistant stores add-on options
locally. The add-on only makes outbound connections to OpenAI's tunnel control
plane and to the configured private MCP URL.

The MCP bearer token must be renewed before it expires. Prefer OAuth or a
dedicated renewable credential when the MCP server supports it.
