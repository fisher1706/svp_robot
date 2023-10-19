*** Settings ***
Documentation       Test Suite for Assessors Registration

Resource            Resources/Setup/webdriver_manager.resource
Resource            POM/Keywords/Modules/spa_assessor_registration_actions.resource

Test Setup          Run Keywords    Open Chrome Browser


*** Test Cases ***
Checking Ability Open Terms And Conditions Page On Step 3
    Test Ability Open Terms And Conditions Page Page

Checking Ability Pass Step 3 Without Agree On Terms And Conditions
    Test Ability Pass Step 3 Without Agree On Terms And Conditions

Checking Ability Pass Step 1 With Empty Required Fields
    Test Ability Pass Step 1 With Empty Required Fields

Checking Ability Pass Step 1 With Incorrect Required Fields
    Test Ability Pass Step 1 With Incorrect Required Fields

Checking Ability Pass Step 2 With Empty Required Fields
    Test Ability Pass Step 2 With Empty Required Fields

Checking Ability Pass Step 3 With Empty Required Fields
    Test Ability Pass Step 3 With Empty Required Fields

Checking Ability To Interrupt The Registration Process And Back To Landing Page From Step 1
    Test Ability Interrupt Registration Step 1

Checking Ability To Interrupt The Registration Process And Back To Landing Page From Step 2
    Test Ability Interrupt Registration Step 2

Checking Ability To Interrupt The Registration Process And Back To Landing Page From Step 3
    Test Ability Interrupt Registration Step 3
