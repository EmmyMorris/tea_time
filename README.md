# [Tea Time Take Home Challenge](https://mod4.turing.edu/projects/take_home/take_home_be)
## Schema
![tea_time_schema](https://user-images.githubusercontent.com/77904287/134056426-5995f447-21f0-437b-8957-5f783021296e.png)


## End Points

### **An endpoint to subscribe a customer to a tea subscription**
  - POST http://localhost:3000/api/v1/customers/:id/subscriptions
  - Example Request and Required Params:
  ``` 
    params: {
      title: "Bob's Peppermint Subscription",
      price: 12.00,
      frequency: 0,
      customer_id: 1,
      tea_id: 1
    } 
   ```
   
   - Frequency:
     -  0 = weekly
     -  1 = biweekly
     -  2 = monthly
     -  3 = bimonthly
 
   - Example Response:
    
  ```
  Comming soon
  ```
<br>

___

<br>

### **An endpoint to cancel a customer’s tea subscription**
  - DELETE http://localhost:3000/api/v1/customers/:id/subscriptions/:id
  - Example Request and Required Params:
  ``` 
    params: {
      title: "Bob's Peppermint Subscription",
      price: 12.00,
      frequency: 0,
      customer_id: 1,
      tea_id: 1
    } 
   ```
   
   - Frequency:
     -  0 = weekly
     -  1 = biweekly
     -  2 = monthly
     -  3 = bimonthly
 
   - Example Response:
    
  ```
  Comming soon
  ```
<br>

___

<br>

### **An endpoint to see all of a customer’s subsciptions (active and cancelled)**
  - GET http://localhost:3000/api/v1/customers/:id/subscriptions
   - Example Response:
    
  ```
  Comming soon
  ```
  
