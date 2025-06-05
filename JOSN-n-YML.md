# JSON & YML 

In following examples 
* `address` is a **dictionary**
* `hobbies` is a **list**

## YML

```yml
name: "John Doe"
age: 30
is_student: false
address:
      street: "123 Main St"
      city: "Springfield"
      state: "IL"
      postal_code: "62701"
hobbies:
      - "Reading"
      - "Cycling"
      - "Photography"
```

* Comments start with # in YML

## JSON

```json
{
      "name": "John Doe",
      "age": 30,
      "isStudent": false,
      "address": {
            "street": "123 Main St",
            "city": "Springfield",
            "state": "IL",
            "postalCode": "62701"
      },
      "hobbies": ["Reading", "Cycling", "Photography"]
}
```

* Comments are not supported in JSON
