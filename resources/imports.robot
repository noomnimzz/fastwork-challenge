*** Settings ***
Library     OperatingSystem
Library     String
Library     Collections
Library     ExtendedSelenium2Library
#Variables   configs/${ENV}/env_config.yaml
Variables   configs/common_config.yaml
Variables   testdata/common_testdata.yaml
Resource    ../keywords/common_keywords.robot
