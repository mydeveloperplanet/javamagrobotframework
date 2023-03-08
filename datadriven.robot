*** Settings ***
Documentation   Basic test for Customer
Library   Collections
Resource  customer.resource


*** Test Cases ***
Create Customers
    [Documentation]  Create several customers
    [Template]  Create Customer
    firstName=John  lastName=Doe  email=john.doe@mail.nl
    firstName=Foo   lastName=Bar  email=foo.bar@mail.nl
    [Teardown]  Delete Customers


*** Keywords ***
Create Customer
    [Documentation]  Create a Customer
    [Arguments]  &{customer}
    ${resp_json}=  Add Customer  ${customer}
    Verify Customer Exists  ${resp_json}

Verify Customer Exists
    [Documentation]  Verify whether provided Customer exists
    [Arguments]  ${resp_json}
    Get Customer  ${resp_json}[customerId]

Delete Customers
    [Documentation]  Delete all customers
    ${resp_json}=  Get Customers
    FOR  ${customer}  IN  @{resp_json}
        Delete Customer  ${customer}[customerId]
    END
