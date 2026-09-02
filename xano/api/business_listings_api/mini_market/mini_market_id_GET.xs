// Get mini_market record
query "mini_market/{mini_market_id}" verb=GET {
  api_group = "Business Listings API"

  input {
    int mini_market_id? filters=min:1
  }

  stack {
    db.get "" {
      field_name = "id"
      field_value = $input.mini_market_id
    } as $mini_market
  
    precondition ($mini_market != null) {
      error_type = "notfound"
      error = "Not Found."
    }
  }

  response = $mini_market
  guid = "FU39Cgn_1ZXwvithghINqP8HTVw"
}