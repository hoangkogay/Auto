net start > "%USERPROFILE%\Desktop\services_dang_chay.txt" & sc query type= service state= all | findstr /C:"SERVICE_NAME" /C:"DISPLAY_NAME" > "%USERPROFILE%\Desktop\tat_ca_services.txt"
