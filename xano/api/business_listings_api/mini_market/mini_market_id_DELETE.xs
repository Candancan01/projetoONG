// Delete mini_market record.
query "mini_market/{mini_market_id}" verb=DELETE {
  api_group = "Business Listings API"

  input {
    int mini_market_id? filters=min:1
  }

  stack {
    db.del "" {
      field_name = "id"
      field_value = $input.mini_market_id
    }
  }

  response = null
  guid = "EeNNYNlYPRT32G78P5b86bUsuog"
}