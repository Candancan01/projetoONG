// Get restaurant record
query "restaurant/{restaurant_id}" verb=GET {
  api_group = "Business Listings API"

  input {
    int restaurant_id? filters=min:1
  }

  stack {
    db.get restaurant {
      field_name = "id"
      field_value = $input.restaurant_id
    } as $restaurant
  
    precondition ($restaurant != null) {
      error_type = "notfound"
      error = "Not Found."
    }
  }

  response = $restaurant
  guid = "xh8aTqEBMH-p5Tj0AIZ1eoBs6ew"
}