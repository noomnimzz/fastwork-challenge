*** Settings ***
Resource    ../../resources/imports.robot
Resource    ../../keywords/features/sign_in_keyword.robot
Resource    ../../keywords/common_keywords.robot
Test Setup    browse to fastwork home page
Test Teardown    close browser

*** Test Cases ***
TC_001 User can sign in with email address
    [Tags]    success
    [Documentation]  To ensure that ...
    Given user has email address and password
    When click sign in menu
    And fill username and password
    And click sign in submit button
    Then user can see notification menu

TC_002 User can not sign in with wrong email address
    [Tags]   fail
    Given user has wrong email address
    When click sign in menu
    And fill username and password
    And click sign in submit button
    Then user can see wrong username error

TC_003 User can not sign in with wrong password
    [Tags]    fail
    Given user has wrong password
    When click sign in menu
    And fill username and password
    And click sign in submit button
    Then user can see wrong password error

TC_004 User can not sign in with empty username
    [Tags]    fail
    Given user has empty username
    When click sign in menu
    And fill username and password
    And click sign in submit button
    Then user can see require username error

TC_005 User can not sign in success with password
    [Tags]    fail
    Given user has empty password
    When click sign in menu
    And fill username and password
    And click sign in submit button
    Then user can see require password error