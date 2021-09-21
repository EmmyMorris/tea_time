# [Tea Time Take Home Challenge](https://mod4.turing.edu/projects/take_home/take_home_be)
## Database Design
![Tea Time Schema](https://user-images.githubusercontent.com/77904287/134219839-96976b69-dfaa-4697-9fd4-b298ae041ba4.png)

## Local Setup

1. Fork and Clone the repo
2. Install gem packages: `bundle install`
3. Setup the database: `rails db:create`
4. Run migrations: ` rails db:migrate`

## Testing
* RSpec and Capybara were used for unit and integration testing and project development adhered to TDD principles.
* Simplecov was used to track total test coverage.
* To run our test suite, RSpec, enter `$ bundle exec rspec` in the terminal.
* To see a coverage report enter `$ open coverage/index.html`
* SimpleCov test coverage is at 100.00%:

![Tea Time Test Coverage](https://user-images.githubusercontent.com/77904287/134245924-7ce5eabe-6241-4c27-aca5-4fa0856c414b.png)

### [Postman Collection](https://www.getpostman.com/collections/563e410d30efa90472d9)
1. Start the server- `rails s`
2. Send requests to endpioints listed below

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
  
## Versions

- Ruby 2.7.2

- Rails 5.2.5

## Authors
- Emmy Morris - [emmymorris](https://github.com/EmmyMorris)
