// Add restaurant record
query restaurant verb=POST {
  api_group = "Business Listings API"

  input {
    dblink {
      table = "restaurant"
    }
  }

  stack {
    db.add restaurant {
      enforce_hidden_fields = false
      data = {created_at: "now"}
    } as $restaurant
  }

  response = $restaurant
  guid = "mPeLzIGU76B04bCnZPfJ1d5C75o"
}