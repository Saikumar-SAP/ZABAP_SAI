CLASS zcl_task_sql DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_TASK_SQL IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

       DATA(lo_connection) = NEW zcl_for_sql_task(
                           i_carrier_ID     = 'LH'
                           i_connection_id = '0400'
                          ).

    DATA(lt_output) = lo_connection->get_output( ).

    out->write( lt_output ).

  ENDMETHOD.
ENDCLASS.
