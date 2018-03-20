*** Settings ***
Resource    ../../resources/imports.robot
Resource    ../../keywords/features/sign_up_keyword.robot
Resource    ../../keywords/common_keywords.robot
Test Setup    browse to fastwork home page
Test Teardown    close browser
Documentation    Please update username for sign up in file : common_testdata.yaml before run script first

*** Test Cases ***
TC_006 User can not sign up with wrong format email address
    [Tags]   fail
    Given user has wrong format email address
    When click sign in menu
    And click sign up link
    And fill username
    And click continue button
    Then user can see wrong format username error

TC_007 User can not sign up with wrong format password
    [Tags]    fail
    Given user has wrong format password
    When click sign in menu
    And click sign up link
    And fill username
    And click continue button
    And fill password
    And fill confirm password
    Then user can see wrong format password error

TC_008 User can not sign up with mismatch password
    [Tags]    fail
    Given user has mismatch password
    When click sign in menu
    And click sign up link
    And fill username
    And click continue button
    And fill password
    And fill confirm password
    And click sign up submit button
    Then user can see mismatch password error

TC_009 User can sign up with email address
    [Tags]    success
    [Documentation]  To ensure that ...
    Given user has email address and password
    When click sign in menu
    And click sign up link
    And fill username
    And click continue button
    And fill password
    And fill confirm password
    And click sign up submit button
    Then user can see notification menu