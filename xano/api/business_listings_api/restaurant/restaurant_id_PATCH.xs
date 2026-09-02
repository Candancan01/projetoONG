// Edit restaurant record
query "restaurant/{restaurant_id}" verb=PATCH {
  api_group = "Business Listings API"

  input {
    int restaurant_id? filters=min:1
    dblink {
      table = "restaurant"
    }
  }

  stack {
    util.get_raw_input {
      encoding = "json"
      exclude_middleware = false
    } as $raw_input
  
    db.patch restaurant {
      field_name = "id"
      field_value = $input.restaurant_id
      data = `$input|pick:($raw_input|keys)`|filter_null|filter_empty_text
    } as $restaurant
  }

  response = $restaurant
  guid = "zGp2DqZPNN5brPe6WoRz0ZBcLrk"
}