*** Settings ***
Documentation   Test in combination with custom Python library
Library   Collections
Library   CustomerLibrary.py
Resource  customer.resource


*** Variables ***
&{CUSTOMER_JOHN_DOE}  firstName=John  lastName=Doe  email=john.doe@mail.nl
&{CUSTOMER_FOO_BAR}   firstName=Foo   lastName=Bar  email=foo.bar@mail.nl


*** Test Cases ***
Find Customer
    [Documentation]  Find Customer
    [Setup]  Create Customers
    ${resp_json}=  Get Customers
    ${exists}=  Verify Customer In List  customers=${resp_json}  email=john.doe@mail.nl
    Should Be True  ${exists}
    [Teardown]  Delete Customers


*** Keywords ***
Create Customers
    [Documentation]  Create a number of Customers
    Add Customer  ${CUSTOMER_JOHN_DOE}
    Add Customer  ${CUSTOMER_FOO_BAR}

Delete Customers
    [Documentation]  Delete all customers
    ${resp_json}=  Get Customers
    FOR  ${customer}  IN  @{resp_json}
        Delete Customer  ${customer}[customerId]
    END
