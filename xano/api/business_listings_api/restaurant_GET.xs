// Query all restaurant records
query restaurant verb=GET {
  api_group = "Business Listings API"

  input {
  }

  stack {
    db.query restaurant {
      return = {type: "list"}
    } as $restaurant
  }

  response = $restaurant
  guid = "DqvR-DwsvDdwRQQFJCIxP3BBATo"
}