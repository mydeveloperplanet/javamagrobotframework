*** Settings ***
Documentation   Basic test for Customer
Library   Collections
Resource  customer.resource


*** Variables ***
&{CUSTOMER_JOHN_DOE}  firstName=John  lastName=Doe  email=john.doe@mail.nl


*** Test Cases ***
Add Customer John Doe
    [Documentation]  Add a Customer
    [Setup]  Verify Customers Length  0
    ${customer}=  Add Customer  ${CUSTOMER_JOHN_DOE}
    Verify Customer Exists  ${customer}
    [Teardown]  Delete Customer  ${customer}[customerId]


*** Keywords ***
Verify Customer Exists
    [Documentation]  Verify whether provided Customer exists
    [Arguments]  ${customer}
    Verify Customers Length  1
    Get Customer  ${customer}[customerId]

Verify Customers Length
    [Documentation]  Verify length of Customers
    [Arguments]  ${expected_size}
    ${customers}=  Get Customers
    ${length}=  Get Length  ${customers}
    Should Be Equal As Integers  ${expected_size}  ${length}
