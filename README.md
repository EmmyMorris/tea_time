# [Tea Time Take Home Challenge](https://mod4.turing.edu/projects/take_home/take_home_be)
## Schema
![Tea Time Schema](https://user-images.githubusercontent.com/77904287/134219839-96976b69-dfaa-4697-9fd4-b298ae041ba4.png)


## End Points

### **An endpoint to subscribe a customer to a tea subscription**
  - POST http://localhost:3000/api/v1/customers/:id/subscriptions
  - Example Request and Required Params:
  ``` 
  http://localhost:3000/api/v1/customers/1/subscriptions
  
    params: {
      "title": "Bob's Peppermint Subscription",
      "price": 12.00,
      "frequency": "weekly",
      "customer_id": 1,
      "tea_id": 1
    } 
   ```
 
   - Example Response:
    
  ```
  {
    "data": {
        "id": "1",
        "type": "subscription",
        "attributes": {
            "id": 1,
            "title": "Bob's Peppermint Subscription",
            "price": 10.0,
            "status": "active",
            "frequency": "monthly",
            "customer_id": 1,
            "tea_id": 1
        }
    }
}
  ```
<br>

___

<br>

### **An endpoint to cancel a customer’s tea subscription**
  - PATCH http://localhost:3000/api/v1/customers/:id/subscriptions/:id
  - Example Request:
  ``` 
http://localhost:3000/api/v1/customers/1/subscriptions/1
   ```
 
   - Example Response:
    
  ```
{
    "data": {
        "id": "1",
        "type": "subscription",
        "attributes": {
            "id": 1,
            "title": "Bob's Peppermint Subscription",
            "price": 12.0,
            "status": "cancelled",
            "frequency": "weekly",
            "customer_id": 1,
            "tea_id": 1
        }
    }
}
  ```
<br>

___

<br>

### **An endpoint to see all of a customer’s subsciptions (active and cancelled)**
  - GET http://localhost:3000/api/v1/customers/:id/subscriptions
  - Example Request:
  ``` 
http://localhost:3000/api/v1/customers/1/subscriptions
   ```
   - Example Response:
    
  ```
  {
    "data": [
        {
            "id": "1",
            "type": "subscription",
            "attributes": {
                "id": 1,
                "title": "Bob's Peppermint Subscription",
                "price": 12.0,
                "status": "cancelled",
                "frequency": "weekly",
                "customer_id": 1,
                "tea_id": 1
            }
        },
        {
            "id": "2",
            "type": "subscription",
            "attributes": {
                "id": 2,
                "title": "Robs Black Tea Subscription",
                "price": 10.0,
                "status": "active",
                "frequency": "monthly",
                "customer_id": 1,
                "tea_id": 1
            }
        }
    ]
}
  ```
  
