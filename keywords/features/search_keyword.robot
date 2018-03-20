*** Settings ***
Library     OperatingSystem
Library     String
Library     Collections
Library     ExtendedSelenium2Library

*** Keywords ***
fill keyword : '${keyword}' and search
    input text    id=desktopNavigationSearch    ${keyword}
    click element    //*[@id="app"]/div[2]/div[2]/div[1]/div/div[1]/div/form/div[2]

page display search result
    element should be visible    //*[@id="app-content"]/div[2]/div[2]/div/div[1]

page do not display search result
    element should not be visible    //*[@id="app-content"]/div[2]/div[2]/div/div[1]