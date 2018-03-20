*** Keywords ***
user has email address and password
    set test variable    ${username}    ${signup_data.email.correct}
    set test variable    ${password}    ${signup_data.password.correct}
    set test variable    ${confirm_password}    ${signup_data.password.correct}

user has wrong format email address
    user has email address and password
    set test variable    ${username}    ${signup_data.email.wrong_format}

user has wrong format password
    user has email address and password
    set test variable    ${password}    ${signup_data.password.wrong_format}

user has mismatch password
    user has email address and password
    set test variable    ${confirm_password}    ${signup_data.password.mismatch}

click sign up link
    wait until page contains element    //html/body/div[2]/div[2]/div[2]/div/div[4]/a[1]
    focus    //html/body/div[2]/div[2]/div[2]/div/div[4]/a[1]
    click element    //html/body/div[2]/div[2]/div[2]/div/div[4]/a[1]
    click element    //html/body/div[2]/div[2]/div[2]/div/div[4]/a[1]

click continue button
    click element    //html/body/div[2]/div[3]/div[2]/div[3]/form/button

fill username
    wait until page contains element    //*[@id="modal"]
    input text    //html/body/div[2]/div[3]/div[2]/div[3]/form/div/div/input    ${username}

fill password
    element text should be    //*[@id="modal"]/div[2]/div/form/div[1]/label    คุณสามารถใช้ล็อกอินนี้ได้
    input text    //*[@id="modal"]/div[2]/div/form/div[3]/div/input    ${password}

fill confirm password
    input text    name=confirmPassword    ${confirm_password}

click sign up submit button
    click element    //*[@id="modal"]/div[2]/div/form/div[5]

user can see wrong format username error
    element text should be    //html/body/div[2]/div[3]/div[2]/div[3]/form/div/small    ใส่หมายเลขโทรศัพท์มือถือหรืออีเมลเท่านั้น

user can see wrong format password error
    element text should be    //html/body/div[2]/div[3]/div[2]/div/form/div[3]/small  ห้ามต่ำกว่า 8 ตัวอักษร

user can see mismatch password error
    element text should be    //html/body/div[2]/div[3]/div[2]/div/form/div[4]/small   รหัสผ่านไม่ตรงกัน