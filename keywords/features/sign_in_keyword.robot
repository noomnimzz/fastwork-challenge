*** Keywords ***
user has email address and password
    set test variable    ${username}    ${signin_data.email.correct}
    set test variable    ${password}    ${signin_data.password.correct}

user has wrong email address
    user has email address and password
    set test variable    ${username}    ${signin_data.email.incorrect}

user has wrong password
    user has email address and password
    set test variable    ${password}    ${signin_data.email.incorrect}

user has empty username
    user has email address and password
    set test variable    ${username}    ${EMPTY}

user has empty password
    user has email address and password
    set test variable    ${password}    ${EMPTY}

fill username and password
    wait until page contains element    //*[@id="modal"]
    input text    //html/body/div[2]/div[2]/div[2]/div/form/div[1]/div/input[1]    ${username}
    input text    //*[@id="modal"]/div[2]/div/form/div[2]/div/input    ${password}

click sign in submit button
    click element    //html/body/div[2]/div[2]/div[2]/div/form/button

user can see wrong username error
    wait until page contains element    //html/body/ul/li/div[1]/div/span
#    element text should be    //html/body/ul/li/div[1]/div[1]/span    คุณใส่ Username ไม่ถูกต้อง กรุณาลองใหม่อีกครั้ง

user can see wrong password error
    wait until page contains element    //html/body/ul/li/div[1]/div[1]/span
#    element text should be    //html/body/ul/li/div[1]/div[1]/span    คุณใส่ Password ไม่ถูกต้อง กรุณาลองใหม่อีกครั้ง

user can see require username error
    element text should be    //html/body/div[2]/div[2]/div[2]/div/form/div[1]/small    กรุณากรอกข้อมูล

user can see require password error
    element text should be    //html/body/div[2]/div[2]/div[2]/div/form/div[2]/small    กรุณากรอกข้อมูล