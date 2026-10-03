#!/usr/bin/with-contenv bashio
set -euo pipefail

TUNNEL_ID="$(bashio::config 'tunnel_id')"
CONTROL_PLANE_API_KEY="$(bashio::config 'control_plane_api_key')"
MCP_SERVER_URL="$(bashio::config 'mcp_server_url')"
MCP_ACCESS_TOKEN="$(bashio::config 'mcp_access_token')"
LOG_LEVEL="$(bashio::config 'log_level')"

if [[ -z "${TUNNEL_ID}" || -z "${CONTROL_PLANE_API_KEY}" || -z "${MCP_ACCESS_TOKEN}" ]]; then
  bashio::log.fatal 'tunnel_id, control_plane_api_key, and mcp_access_token are required.'
  exit 1
fi

export CONTROL_PLANE_API_KEY
export MCP_AUTHORIZATION="Bearer ${MCP_ACCESS_TOKEN}"
export MCP_SERVER_URL MCP_ACCESS_TOKEN LOG_LEVEL

exec tunnel-client run \
  --control-plane.api-key=env:CONTROL_PLANE_API_KEY \
  --control-plane.tunnel-id="${TUNNEL_ID}" \
  --mcp.server-url="${MCP_SERVER_URL}" \
  --mcp.extra-headers='Authorization: env:MCP_AUTHORIZATION' \
  --log.level="${LOG_LEVEL}"
