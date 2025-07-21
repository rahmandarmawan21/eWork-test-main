# eWork Mobile App Robot Framework Test

## Overview
This project contains automated end-to-end test scenarios for the eWork mobile application using Robot Framework and Appium.

## Folder Structure
- `test/` : Contains Robot Framework test cases, keywords, and resources
- `test/pageObject/` : Page Object Model (POM) locators
- `test/testdata/` : Test data variables
- `results/` : Test output and reports

## Prerequisites
- Python 3.x
- Appium server running
- Android emulator or device
- Install dependencies:
  ```sh
  pip install robotframework robotframework-appiumlibrary
  ```

## How to Run the Test
1. Start your Appium server and connect your Android device/emulator.
2. Edit test data in `test/testdata/` as needed.
3. Run the test scenario:
   ```sh
   robot test/e2e-test.robot
   ```
4. View results in the `results/` folder (log.html, report.html).

## Notes
- Update locators in `test/pageObject/object_page.robot` if your app UI changes.
- Custom keywords are in `test/resources/keyword.robot`.

---
Happy Testing!
