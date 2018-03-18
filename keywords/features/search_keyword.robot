*** Settings ***
Resource    ../../resources/imports.robot
Variables    ../../resources/common_configs.yaml
Variables    ../../resources/testdata/common/common_testdata.yaml

*** Keywords ***
user truemoveh pre paid
    set test variable    ${mobile_number}    ${buy_vas_with_airtime.msisdn_pre_paid}

user truemoveh post paid
    set test variable    ${mobile_number}    ${buy_vas_with_airtime.msisdn_post_paid}

user access with wifi
    set test variable    ${mobile_number}    ${empty}

display search page
    ${class_status}    get element attribute    id=menu_search@class
    should be equal as strings    active    ${class_status}
    capture page screenshot

go to search page
    go to ecatalog page
    click element    id=menu_search
    display search page

input keyword pre for search
    input text    id=keyword    ${keyword pre for search}

input keyword post for search
    input text    id=keyword    ${keyword post for search}

submit search
    press key  id=keyword   \\13
    capture page screenshot

select search type
    click element  //*[@id="form"]/div/div/span[1]

select search type pre
    select search type
    click element  //*[@id="form"]//li[text() = 'เติมเงิน']

select search type post
    select search type
    click element  //*[@id="form"]//li[text() = 'รายเดือน']

select search type all
    select search type
    click element  //*[@id="form"]//li[text() = 'ทั้งหมด']


display success pre for search
    page should contain   ${keyword pre for search}

display success post for search
    page should contain   ${keyword post for search}
