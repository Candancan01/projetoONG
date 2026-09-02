// Stores menu items for restaurants
table menu {
  auth = false

  schema {
    int id
    timestamp created_at?=now {
      visibility = "private"
    }
  
    // Reference to the restaurant that this menu item belongs to
    int restaurant? {
      table = "restaurant"
    }
  
    // Name of the menu item
    text name? filters=trim
  
    // Description of the menu item
    text description? filters=trim
  
    // Price of the menu item
    decimal price?
  
    // Category of the menu item (e.g., Appetizer, Main Course, Dessert)
    text category? filters=trim
  
    // Image of the menu item
    image image?
  }

  index = [
    {type: "primary", field: [{name: "id"}]}
    {type: "gin", field: [{name: "xdo", op: "jsonb_path_op"}]}
    {type: "btree", field: [{name: "created_at", op: "desc"}]}
  ]

  guid = "8GXxx0_zz3dOJVRovMe5dL8ZidE"
}