// Query all mini_market records
query mini_market verb=GET {
  api_group = "Business Listings API"

  input {
  }

  stack {
    db.query "" {
      return = {type: "list"}
    } as $mini_market
  }

  response = $mini_market
  guid = "xRN6J4J1-nH1tRiL9ebylP_E3nk"
}