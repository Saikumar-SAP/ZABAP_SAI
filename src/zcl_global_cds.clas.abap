CLASS zcl_global_cds DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_GLOBAL_CDS IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA(lo_connection) = NEW zcl_local_cds(
                           i_carrier_ID     = 'LH'
                           i_connection_id = '0400'
                           i_carrier_name = 'American Airlines Inc.'
                          ).

    DATA(lt_output) = lo_connection->get_output( ).

    out->write( lt_output ).

  ENDMETHOD.
ENDCLASS.
