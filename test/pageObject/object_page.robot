*** Variables ***
${BTN_ALLOW_PERMISSION}    xpath=//android.widget.Button[@resource-id="com.android.permissioncontroller:id/permission_allow_button"]
${TXT_COMPANY_ID}          id=id.edot.ework:id/tv_company_id
${TXT_USERNAME}            id=id.edot.ework:id/tv_username
${TXT_PASSWORD}            id=id.edot.ework:id/tv_password
${BTN_LOGIN}               id=id.edot.ework:id/button_text
${BTN_ALLOW_FOREGROUND}    id=com.android.permissioncontroller:id/permission_allow_foreground_only_button
${TXT_ERR_LOGIN}           xpath=//android.widget.TextView[@resource-id="id.edot.ework:id/textView"]
#HOME MENU
${LOGO_EWORK}             id=id.edot.ework:id/img_ework
${BTN_NEW_CUSTOMER}       xpath=//android.view.ViewGroup[@resource-id="id.edot.ework:id/cl_menu1" and .//android.widget.TextView[@text="New Customer"]]
${TXT_HEADER}             id=id.edot.ework:id/tvTitleHeader
${BTN_REG_NEWCUSTOMER}    id=id.edot.ework:id/tvRegister
${TXT_OUTLET_NAME}        id=id.edot.ework:id/et_outlet_name
${TXT_OUTLET_PHONE}       id=id.edot.ework:id/et_outlet_phone
${TXT_OUTLET_EMAIL}       id=id.edot.ework:id/et_outlet_email
${TXT_CONTACT_PERSON}     id=id.edot.ework:id/et_contact_person
${DROPDOWN_CHANNEL}       id=id.edot.ework:id/et_channel
${CHANNEL_MT}             xpath=//android.widget.TextView[@resource-id="id.edot.ework:id/tvName" and @text="Modern Trade (MT)"]
${DROPDOWN_OUTLET_TYPE}   id=id.edot.ework:id/et_outlet_type
${OUTLET_GROSIR}          xpath=//android.widget.TextView[@resource-id="id.edot.ework:id/tvName" and @text="Grosir"]
${TXT_TITLE_POPUP}        id=id.edot.ework:id/tvTitle
${BTN_CONTINUE}           id=id.edot.ework:id/button_text
${DROPDOWN_ADDRESS}       id=id.edot.ework:id/et_address_type
${ADDRESS_TYPE}           xpath=//android.widget.TextView[@resource-id="id.edot.ework:id/tvName" and @text="Delivery Address"]
${TXT_ADDRESS}            id=id.edot.ework:id/etAddress
${DROPDOWN_PROVINCE}      xpath=//android.widget.EditText[@resource-id="id.edot.ework:id/etInput" and @text="Choose Province"]
${DROPDOWN_CITY}          xpath=//android.widget.EditText[@resource-id="id.edot.ework:id/etInput" and @text="Choose City"]
${DROPDOWN_DISTRICT}      xpath=//android.widget.EditText[@resource-id="id.edot.ework:id/etInput" and @text="Choose District"]
${DROPDOWN_SUBDISTRICT}   xpath=//android.widget.EditText[@resource-id="id.edot.ework:id/etInput" and @text="Choose Sub district"]
${DROPDOWN_POSTAL_CODE}   xpath=//android.widget.EditText[@resource-id="id.edot.ework:id/etInput" and @text="Choose Postal code"]
${TXT_TITLE_FILTER}       id=id.edot.ework:id/txt_filter
${TXT_POSTAL}             id=id.edot.ework:id/txt_name

${BTN_POSITIVE}           id=id.edot.ework:id/btn_positive
${KTP}                    id=id.edot.ework:id/etInput
${BTN_UPLOAD}             id=id.edot.ework:id/btn_upload
${BTN_SUBMIT}             id=id.edot.ework:id/btn_continue
${BTN_CAPTURE}            id=id.edot.ework:id/btn_capture
${TV_PREVIEW}            id=id.edot.ework:id/tv_preview

${SIGNATURE_VIEW}       id=id.edot.ework:id/signature_view
${BTN_SUBMIT_REG}       xpath=//android.widget.Button[@resource-id="id.edot.ework:id/button_text" and @text="Submit"]
${BTN_SUBMIT_SIGN}       xpath=//android.widget.Button[@resource-id="id.edot.ework:id/button_text" and @text="Register"]
${BTN_SUBMIT_YES}       xpath=//android.widget.Button[@resource-id="id.edot.ework:id/button_text" and @text="Yes"]