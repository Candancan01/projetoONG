// Edit mini_market record
query "mini_market/{mini_market_id}" verb=PATCH {
  api_group = "Business Listings API"

  input {
    int mini_market_id? filters=min:1
    dblink {
      table = ""
    }
  }

  stack {
    util.get_raw_input {
      encoding = "json"
      exclude_middleware = false
    } as $raw_input
  
    db.patch "" {
      field_name = "id"
      field_value = $input.mini_market_id
      data = `$input|pick:($raw_input|keys)`|filter_null|filter_empty_text
    } as $mini_market
  }

  response = $mini_market
  guid = "Czett2rOrMtOjDn2UBbL-1rZc_o"
}