customer = Customer.create!(email:"testis@testitis.com",password:"qwerty4323a", password_confirmation:"qwerty4323a")
funeral =  Funeral.new(cat_name:"Rudolf",start_time:DateTime.new(2017,1,12,7).in_time_zone,customer_id:customer.id).save(validate: false)
funeral =  Funeral.new(cat_name:"Jewel",start_time:DateTime.new(2017,1,12,11).in_time_zone,customer_id:customer.id).save(validate: false)
funeral =  Funeral.new(cat_name:"Steam",start_time:DateTime.new(2017,1,14,11).in_time_zone,customer_id:customer.id).save(validate: false)
funeral =  Funeral.new(cat_name:"Steam2",start_time:DateTime.new(2017,1,21,11).in_time_zone,customer_id:customer.id).save(validate: false)
funeral =  Funeral.new(cat_name:"Kitty",start_time:DateTime.new(2017,1,21,13).in_time_zone,customer_id:customer.id).save(validate: false)
funeral =  Funeral.new(cat_name:"Hamlet",start_time:DateTime.new(2017,1,22,7).in_time_zone,customer_id:customer.id).save(validate: false)
funeral =  Funeral.new(cat_name:"Shepherd",start_time:DateTime.new(2017,1,22,9).in_time_zone,customer_id:customer.id).save(validate: false)
funeral =  Funeral.new(cat_name:"Nyx",start_time:DateTime.new(2017,1,22,11).in_time_zone,customer_id:customer.id).save(validate: false)
funeral =  Funeral.new(cat_name:"Tugg",start_time:DateTime.new(2017,1,22,13).in_time_zone,customer_id:customer.id).save(validate: false)
funeral =  Funeral.new(cat_name:"Madonna",start_time:DateTime.new(2017,1,22,15).in_time_zone,customer_id:customer.id).save(validate: false)
funeral =  Funeral.new(cat_name:"Scotty",start_time:DateTime.new(2017,1,26,15).in_time_zone,customer_id:customer.id).save(validate: false)
funeral =  Funeral.new(cat_name:"Archer",start_time:DateTime.new(2017,1,26,15).in_time_zone,customer_id:customer.id).save(validate: false)
