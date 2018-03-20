*** Settings ***
Resource    ../../resources/imports.robot
Resource    ../../keywords/features/search_keyword.robot
Suite Setup    browse to fastwork home page
Suite Teardown    close browser

*** Test Cases ***
TC_010 User can search and found a result
    [Tags]    success
    fill keyword : 'test' and search
    page display search result

TC_011 User can search but result not found
    [Tags]    success
    fill keyword : '0000100000100001' and search
    page do not display search result