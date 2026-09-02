table restaurant {
  auth = false

  schema {
    int id
    timestamp created_at?=now {
      visibility = "private"
    }
  
    text name?
    text address?
    text phone_number?
    email email?
    text website?
  
    // Secure password for restaurant owner login
    password password?
  }

  index = [
    {type: "primary", field: [{name: "id"}]}
    {type: "btree", field: [{name: "created_at", op: "desc"}]}
  ]

  guid = "kywcV0xo2BXZXnEAFxB8SL5wRvc"
}