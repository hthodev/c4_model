workspace {

    model {
       admin = person "Admin" "A manager who manages the project's operations." "Manager"
       customer = person "Customer" "A person users website of booking schedule  medical examine ." 
       doctor = person "Doctor" "A person with a medical degree whose job is to treat." 
       emailSystem = softwareSystem "E-mail System" "The internet Microsoft Exchange e-mail system.""Existing System"

       softwareSystem = softwareSystem "SYSTEM BOOKING TO SCHEDULES INTERNET" {
        webApplication = container "Web Application" "Delivers the static content and the Internet booking to schedules single page application." "ReactJS" {
            customer -> webApplication "Uses"
        }
        singlePageApp = container "Single-Page Application" "Provides all of Booking to Schedule medical examine functionality to customer via their web browser." "ReactJS" {
            customer -> singlePageApp "Uses"
            webApplication -> singlePageApp "Delivers"
        }
        
        apiApplication = container "API Application" "Provides Booking to Schedule medical examine functionality via a JSON/HTTP API ." "NodeJS express" {
            singlePageApp -> apiApplication "Uses [JSON/HTTPS]"
           
        }
        
        database = container "Database" "Store user registration information, hashed authentication credentials access logs,..." "MySQL" "Database"{
            apiApplication -> database "Protocol/SSL"
        }

       }
       
       admin -> webApplication "Uses"
       doctor -> webApplication "Uses"
       doctor -> singlePageApp "Uses"
       apiApplication -> emailSystem "Sends e-mail using "
       emailSystem -> doctor "Sends e-mail to"
       emailSystem -> customer "Sends e-mail to"
     

       
    }
    views {
      

        container softwareSystem {            
        include *
            autoLayout lr

        }
        
        styles {
            element "Person" {
                shape Person
                background #08427b
                color #ffffff
            }
            element "Software System" {
                background #1168bd
                color #ffffff
            }
            element "Container" {
                background #1168bd
                color #ffffff
            }
            element "Existing System"{
                 background #999999
                color #ffffff
            }
            element "Database"{
                shape Cylinder
            }
            
          
        }
    }
}