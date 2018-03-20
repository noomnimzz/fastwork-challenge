*** Settings ***
Resource    ../../resources/imports.robot
Resource    ../../keywords/features/search_keyword.robot
Suite Setup    browse to fastwork home page
Suite Teardown    close browser

*** Test Cases ***
TC_010 User can search and found result
    [Tags]    success
    fill keyword : 'test' and search
    fastwork display search result

TC_011 User can search but result not found
    [Tags]    success
    fill keyword : '0000100000100001' and search
    fastwork do not display search result