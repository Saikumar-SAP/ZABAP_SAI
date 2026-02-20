CLASS zdata_updation DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
   INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZDATA_UPDATION IMPLEMENTATION.


 METHOD if_oo_adt_classrun~main.

 DATA lt_appts TYPE STANDARD TABLE OF zptnt_apnmt_tab.
DATA ls_appt  TYPE zptnt_apnmt_tab.

"-----------------------------------
" Appointment for Patient P0001
"-----------------------------------
ls_appt-client         = sy-mandt.
ls_appt-patient_id     = 'P0001'.
ls_appt-appointment_id = 'A0001'.
ls_appt-doctorid       = 'DR1001'.
ls_appt-apptdate       = '20250210'.
ls_appt-appttime       = '093000'.
ls_appt-status         = 'BOOKED'.
APPEND ls_appt TO lt_appts.

"-----------------------------------
" Appointment for Patient P0002
"-----------------------------------
ls_appt-patient_id     = 'P0002'.
ls_appt-appointment_id = 'A0002'.
ls_appt-doctorid       = 'DR2001'.
ls_appt-apptdate       = '20250211'.
ls_appt-appttime       = '110000'.
ls_appt-status         = 'BOOKED'.
APPEND ls_appt TO lt_appts.

DELETE FROM zptnt_apnmt_tab.

INSERT zptnt_apnmt_tab FROM TABLE @lt_appts.



  COMMIT WORK.
    out->write( 'Booking data inserted'  ).



 endMETHOD.
ENDCLASS.
