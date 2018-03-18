*** Settings ***
Resource    ../../resources/imports.robot
Resource    ../../keywords/common/common_db_keywords.robot
Variables    ../../resources/common_configs.yaml
Variables    ../../resources/testdata/common/common_testdata.yaml

*** Keywords ***
user truemoveh post paid
    set test variable    ${mobile_number}    ${buy_vas_with_airtime.msisdn_post_paid}

user truemoveh pre paid
    set test variable    ${mobile_number}    ${buy_vas_with_airtime.msisdn_pre_paid}

user access with wifi
    set test variable    ${mobile_number}    ${empty}

display tab toggle for choose prepaid package or postpaid package
    page should contain element     id=package-type-tab

display 5 postpaid packages
    Connect Database
    @{postpaid_best_seller_package}  Select lastest postpaid best seller packages
    set test variable    @{postpaid_best_seller_package}
    Disconnect Database
    Check postpaid best seller list

display 5 prepaid packages
    Connect Database
    @{prepaid_best_seller_package}    Select lastest prepaid best seller packages
    Set test variable    @{prepaid_best_seller_package}
    Disconnect Database
    Check prepaid best seller list

display ussd packages
    Connect Database
    @{ussd_only_best_seller_package}    Select ussd only best seller package
    Set test variable    @{ussd_only_best_seller_package}
    Disconnect Database
    Check ussd only best seller list

Check prepaid best seller list
    ${index}    Set Variable    1
    :FOR    ${list}    IN    @{prepaid_best_seller_package}
    \    element text should be    id=head_best_seller_${index}_PRE   ${list[0]}
    \   ${index}    Evaluate    ${index} + 1

Check postpaid best seller list
    ${index}    Set Variable    1
    :FOR    ${list}    IN    @{postpaid_best_seller_package}
    \    element text should be    id=head_best_seller_${index}_POS   ${list[0]}
    \   ${index}    Evaluate    ${index} + 1

Check ussd only best seller list
    ${index}    Set Variable    1
    :FOR    ${list}    IN    @{ussd_only_best_seller_package}
    \    ${href}    Get Element Attribute    id=buy_package_${list[0]}@href
    \    should contain    ${href}    ${ussd_href}
    \    ${index}    Evaluate    ${index} + 1

Select lastest postpaid best seller packages
    @{queryResults}    Query    SELECT `topping_package`.`title_th` FROM `hlife_best_seller` LEFT JOIN `topping_package` ON `hlife_best_seller`.`package_id` = `topping_package`.`id` WHERE `hlife_best_seller`.`service_number_type` = 'POS' AND (`topping_package`.`allow_buy` = 'Y' OR `topping_package`.`allow_buy` = 'R' OR `topping_package`.`allow_buy` = 'F') GROUP BY `topping_package`.`id` ORDER BY `display_order` ASC;
    [Return]  @{queryResults}

Select lastest prepaid best seller packages
    @{queryResults}    Query    SELECT `topping_package`.`title_th` FROM `hlife_best_seller` LEFT JOIN `topping_package` ON `hlife_best_seller`.`package_id` = `topping_package`.`id` WHERE `hlife_best_seller`.`service_number_type` = 'PRE' AND (`topping_package`.`allow_buy` = 'Y' OR `topping_package`.`allow_buy` = 'R' OR `topping_package`.`allow_buy` = 'F') GROUP BY `topping_package`.`id` ORDER BY `display_order` ASC;
    [Return]  @{queryResults}

Select ussd only best seller package
    ${current_date}    Get Current DateTime
    Log    ${current_date}
    @{queryResults}    Query    SELECT `topping_package`.`id` FROM `hlife_best_seller` JOIN `topping_package` ON `topping_package`.`id` = `hlife_best_seller`.`package_id` WHERE `hlife_best_seller`.`service_number_type` = 'PRE' AND `topping_package`.`allow_ussd_only` = '1' AND `active` = '1' AND SYSDATE() BETWEEN `topping_package`.`start_date` AND `topping_package`.`end_date`;
    [Return]  @{queryResults}
