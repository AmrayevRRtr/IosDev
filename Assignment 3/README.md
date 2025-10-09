🛒 Shopping Cart System – README
💡 Overview
This project is a simple Shopping Cart system built in Swift.
It allows users to add and remove products, apply discounts, and create orders.
The main goal of this lab work was to understand the difference between classes and structs, how to use value and reference semantics, and how to design a small but realistic software model.
🧱 Why I chose a class for ShoppingCart
I used a class for ShoppingCart because a shopping cart is something that changes over time and should be shared by reference.
When a user adds or removes items, the same cart object is updated.
If I used a struct, every time I modified the cart it would create a copy, which is not what we want — we need one shared instance that represents the current cart.
Classes in Swift have reference semantics, meaning all parts of the program can access and modify the same cart object.
That makes sense for something like a user’s active shopping session.
📦 Why I chose structs for Product and Order
Product and Order are modeled as structs because they represent fixed data.
A product doesn’t need to be shared and modified across different places — it’s just information like name, price, and stock.
When I create an order, I want it to be independent and not change later if the original cart changes.
Structs have value semantics, meaning each copy is separate and safe from unwanted side effects.
🔁 Example where reference semantics matter
When I call:
cart.addItem(product: laptop, quantity: 1)
and later:
modifyCart(cart)
both use the same ShoppingCart instance.
Any change made inside modifyCart() (like adding an item) affects the original cart because classes are reference types.
This behavior is exactly what I needed for a cart shared across multiple functions.
🧮 Example where value semantics matter
For CartItem and Product, value semantics help prevent bugs.
If I change the price of one Product variable, it doesn’t affect other copies of the same product.
Each struct keeps its own data, so I can safely reuse products or items without unexpected changes.
⚙️ Challenges and solutions
At first, I faced access control and initializer errors because many structs had internal access by default.
I fixed this by marking properties and initializers as public.
Another challenge was concurrency errors in Playgrounds when accessing variables from the main actor.
I solved this by marking functions with @MainActor or passing values as parameters.
These issues helped me better understand Swift’s safety system and how data isolation works.
