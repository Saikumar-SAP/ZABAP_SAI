CLASS zcl_task DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_TASK IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA(lo_connection) = NEW zcl_local_cl1(
                            i_carrier_id    = 'LH'
                            i_connection_id = '0400'
                          ).

    DATA(lt_output) = lo_connection->get_output( ).

    out->write( lt_output ).

  ENDMETHOD.
ENDCLASS.
