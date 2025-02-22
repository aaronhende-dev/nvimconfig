return {
  "CopilotChat.nvim",
  opts = {
    http = {
      extra_curl_args = { "--ssl-no-revoke" }, -- Disables SSL revocation check
    },
  },
}
