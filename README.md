
# Fastwork QA Challenge

## Prerequisites
- python 2.7 and pip
- chrome
- chrome driver
- robotframework

## Installing
` 
pip install -r requirement.txt
`
## Project Structure
    - resources
      - configs
        - staging
          - env_config.yaml
      - testdata
        - common
          - common_testdata.yaml
      - imports.robot (imports configurations and libraries)
      - common_configs.yaml 
    - testcases 
      - authentication (feature)
        - sign_in.robot (subfeature)
        - sign_up.robot (subfeature)
    - keywords
      - feature
        - sign_in_keyword.robot
        - sign_up_keyword.robot
      - common
        - common_keywords.robot
    - requirements.txt
    - README.md


## Running the Test
### Run Full Test Suite
`
pybot -L TRACE -d result testcases
`

### Run Test Suite
navigate to `testcases` directory

`
pybot -L TRACE -d result -t * test_suite_name.robot
`

### Run Test Case
navigate to `testcases/feature` directory

`
pybot -L TRACE -d result -t "test case name" test_suite_name.robot
`

### Run by Tag
navigate to `testcases` directory

`
pybot -L TRACE -d result -i tag_name -t * test_suite_name.robot
`
