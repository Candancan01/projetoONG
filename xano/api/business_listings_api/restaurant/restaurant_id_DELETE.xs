// Delete restaurant record.
query "restaurant/{restaurant_id}" verb=DELETE {
  api_group = "Business Listings API"

  input {
    int restaurant_id? filters=min:1
  }

  stack {
    db.del restaurant {
      field_name = "id"
      field_value = $input.restaurant_id
    }
  }

  response = null
  guid = "j1DLD-MVaQgdCibHAYM7siYRHBc"
}