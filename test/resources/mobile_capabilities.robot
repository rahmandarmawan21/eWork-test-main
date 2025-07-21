*** Variables ***
# --- Desired Capabilities untuk Android ---
${PLATFORM_NAME}         Android
${PLATFORM_VERSION}      14.0    
${DEVICE_NAME}           RRCW2039AHL  
${APP_PACKAGE}           id.edot.ework 
${APP_ACTIVITY}          id.edot.onboarding.ui.splash.SplashScreenActivity
${APPIUM_SERVER_URL}     http://localhost:4723/wd/hub

# --- Common Appium Settings ---
${NO_RESET}              true    # Jangan reset aplikasi setelah setiap se
${FULL_RESET}            false   # Jangan lakukan full reset