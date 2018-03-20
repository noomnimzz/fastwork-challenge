*** Settings ***
Library     OperatingSystem
Library     String
Library     Collections
Library     ExtendedSelenium2Library

*** Keywords ***
browse to fastwork home page
    open browser    ${fastwork_homepage_url}    ${browser}
    not allow browser notificaion

wait until display notificaion pop-up
    wait until element is visible    id=onesignal-popover-cancel-button

click no,thanks button
    click button    id=onesignal-popover-cancel-button

not allow browser notificaion
    ${passed}    run keyword and return status    wait until display notificaion pop-up
    run keyword if    '${passed}' == 'True'    click no,thanks button

click sign in menu
### locator element should be id or name ###
    click element    xpath=//*[@id="app"]/div[2]/div[2]/div[1]/div/div[2]/div[2]/div[2]

user can see notification menu
### locator element should be id or name ###
    element text should be    //*[@id="app"]/div[2]/div[2]/div[1]/div/div[2]/div[1]/div    แจ้งเตือน