*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***

${base_url}    https://jsonplaceholder.typicode.com

*** Test Cases ***

first run this test
    Create Session    endpoint    ${base_url}
    GET    ${base_url}/photos
