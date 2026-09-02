// Add mini_market record
query mini_market verb=POST {
  api_group = "Business Listings API"

  input {
    dblink {
      table = ""
    }
  }

  stack {
    db.add "" {
      enforce_hidden_fields = false
      data = {created_at: "now"}
    } as $mini_market
  }

  response = $mini_market
  guid = "hmjS1R5Uxnufxw-lFRjyAHn-J64"
}