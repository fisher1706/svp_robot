*** Settings ***
Documentation       Test Suite for Individual Booking

Resource            Resources/Setup/webdriver_manager.resource
Resource            POM/Keywords/Modules/login_actions.resource
Resource            POM/Keywords/Modules/spa_individual_booking_actions.resource
Variables           Resources/Variables/LoginDataset.py
Variables           POM/Locators/IndividualBaseLocators.py
Variables           Resources/Variables/SuccessMessage.py

Test Setup          Open Chrome Browser


*** Test Cases ***
Checking Booked Appointment Status After Successful Payment
    Skip        https://is-takamol.atlassian.net/browse/PVPE-1826
    Log In To The Spa Portal
    Individual Booking Actions

Checking That User Can Not Book Session Within The Same Category Until The Session Status Is Reserved
    Log In To The Spa Portal
    Individual Booking Actions      payment=False

Checking Error Message When Individual Tries To Create Second Reservation For The Same Exam Session
    Skip        https://is-takamol.atlassian.net/browse/PVPE-1826

Checking Error Message When Individual Tries To Reserve Session For Category But The Category Code Do Not Matches
    Skip        https://is-takamol.atlassian.net/browse/PVPE-1826

Checking Booked Appointment Status If Payment Is Pending
    Skip        https://is-takamol.atlassian.net/browse/PVPE-1826

Checking The Payment Failed Error Message
    Skip        https://is-takamol.atlassian.net/browse/PVPE-1826

Checking The Pending Payment Message
    Skip        https://is-takamol.atlassian.net/browse/PVPE-1826

Checking Ability To Download Ticket From The Booking Page
    Skip        https://is-takamol.atlassian.net/browse/PVPE-1826

Checking Ability To Download Ticket From The Booking Details Page
    Skip        https://is-takamol.atlassian.net/browse/PVPE-1826

Checking That Individual Can Go To The Transaction History Tab Nnd View All Transactions Made By Them
    Skip        https://is-takamol.atlassian.net/browse/PVPE-1826

Checking That Individual Can Download Invoices In The Transaction History Tab After Successful Payment
    Skip        https://is-takamol.atlassian.net/browse/PVPE-1826

Checking That Individual Is Able To Use Filters For Transaction History
    Skip        https://is-takamol.atlassian.net/browse/PVPE-1826
