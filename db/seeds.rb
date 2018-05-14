Restaurant.create([
  {
    name: "Señor Gourmet",
    image_url: "https://source.unsplash.com/400x200/?restaurant",
    min_price: 8000,
    max_price: 20000,
    location: "Bloque 4"
   },
   {
    name: "Donde Tavo",
    image_url: "https://source.unsplash.com/400x200/?restaurant",
    min_price: 5000,
    max_price: 20000,
    location: "Bloque 4"
   },
   {
    name: "Mandarina",
    image_url: "https://source.unsplash.com/400x200/?restaurant",
    min_price: 8000,
    max_price: 20000,
    location: "Bloque 12"
   }
])

MenuItem.create([
  {
    item_name: "Papas Mexicanas",
    description: "Pico de gallo, guacamole, sour cream",
    price: 13500,
    image_url: "https://source.unsplash.com/400x200/",
    quantity: 100,
    restaurant_id: 1
  },
  {
    item_name: "Bandeja Paisa",
    description: "fríjoles, arroz, carne molida",
    price: 7500,
    image_url: "https://source.unsplash.com/400x200/",
    quantity: 100,
    restaurant_id: 2
  },
  {
    item_name: "Pizza Hawaina",
    description: "Jamón, Piña, Queso",
    price: 5500,
    image_url: "https://source.unsplash.com/400x200/",
    quantity: 100,
    restaurant_id: 3
  },
])

Customer.create([
  {
    name: "Mateo Pulgarín",
    phone_number: "+57 301 7355260"
  },
  {
    name: "Juan Pablo Montoya",
    phone_number: "+57 304 6777894"
  },
  {
    name: "Brayan López",
    phone_number: "+57 300 5968903"
  },
  {
    name: "Ana María Sosa",
    phone_number: "+57 315 5533098"
  }
])


OrderStatus.create([
  {
    description: "Recibida"
  },
  {
    description: "Pendiente de aprobación"
  },
  {
    description: "En Proceso"
  },
  {
    description: "Lista para recoger"
  },
  {
    description: "Entregada"
  }
])

Order.create([
  {
    menu_item_id: 1,
    customer_id: 4,
    quantity: 2,
  }
])
