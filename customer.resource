*** Settings ***
Documentation  resource file for Customer resources
Library  RequestsLibrary


*** Variables ***
${HOST_URL}           http://localhost:8080
${CUSTOMER_ENDPOINT}  ${HOST_URL}/customer


*** Keywords ***
Add Customer
    [Documentation]  Add a Customer
    [Arguments]  ${json}
    ${headers}=  Create Dictionary  Content-Type=application/json
    ${resp}=  POST  url=${CUSTOMER_ENDPOINT}  headers=${headers}  json=${json}  expected_status=200
    RETURN    ${resp.json()}

Get Customer
    [Documentation]  Get a Customer
    [Arguments]  ${customer_id}
    ${resp}=  GET  url=${CUSTOMER_ENDPOINT}/${customer_id}  expected_status=200
    RETURN  ${resp.json()}

Get Customers
    [Documentation]  Get all Customers
    ${resp}=  GET  url=${CUSTOMER_ENDPOINT}  expected_status=200
    RETURN  ${resp.json()}

Delete Customer
    [Documentation]  Delete a Customer
    [Arguments]  ${customer_id}
    ${resp}=  DELETE  url=${CUSTOMER_ENDPOINT}/${customer_id}  expected_status=200
    RETURN  ${resp.json()}
