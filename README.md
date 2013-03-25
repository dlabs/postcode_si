## postcode_si

This project provides high performance JavaScript geo-coding library and server for Slovenian postcodes.

## using postcode_si from browser

    <script type="text/javascript" src="./postcode_si.js"></script>
    
    ...
    var some_point = [46.11132565729796, 14.508132934570312]
    
    var points_near_location = postcode_si.near(some_point)
    
    console.log(points_near_location[0].town)
    // Ljubljana - Šmartno
    
## using postcode_si from Node.js

    var postcodes = require("./postcode_si").postcodes
    
    var some_point = [46.11132565729796, 14.508132934570312] 
    
    var points_near_location = postcodes.near(some_point)
    
    console.log(points_near_location[0].town)
    // Ljubljana - Šmartno
    
## Using REST API

Sample server is running on [Heroku](http://postcode-si.herokuapp.com). You can try it out using simple curl command...

    curl -D - "http://postcode-si.herokuapp.com/near?lat=46.34491313908172&lon=15.057792663574219"
    
    [
      {
        "town": "Šmartno ob Paki",
        "lat": 46.32903719999999,
        "lng": 15.0333937,
        "org": "",
        "postcode": 3327,
        "distance_from_origin": 2573.901643731017
      },
      {
        "town": "Velenje",
        "lat": 46.3443933,
        "lng": 15.0083019,
        "org": "Gorenje",
        "postcode": 3503,
        "distance_from_origin": 3799.3479104102053
      },
      ...
      
    
## Authors
- [Oto Brglez](https://github.com/otobrglez)
