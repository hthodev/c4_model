@startuml
!include <c4/C4_Context.puml>  
!include https://raw.githubusercontent.com/plantuml-stdlib/C4-PlantUML/master/C4_Container.puml


Person(customer, Person Banking Customer , "A customer of the bank, with personal bank accounts" )
System(banking_system, "Internet Banking System", "Allows customers to view information about their bank accounts, and make payments.")
System_Ext(mail_system, "E-mail system", "The internal Microsoft Exchange e-mail system.")
System_Ext(mainframe, "Mainframe Banking System", "Stores all of the core banking information about customers, accounts, transactions, etc.")

Lay_U(banking_system, customer)
Lay_R(banking_system, mail_system)
Lay_D(banking_system, mainframe)

Rel_D(customer,banking_system, "Uses")
Rel_D(banking_system, mainframe, "Uses")
Rel_R(banking_system, mail_system , "Email using to")
Rel_Back(customer, mail_system, "Email using back")


@enduml