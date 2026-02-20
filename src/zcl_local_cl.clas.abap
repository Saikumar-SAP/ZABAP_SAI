CLASS zcl_local_cl DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  METHODS constructor
      IMPORTING
        i_connection_id TYPE /dmo/connection_id
        i_carrier_id    TYPE /dmo/carrier_id
      RAISING
        cx_abap_invalid_value.

    METHODS get_output
      RETURNING VALUE(r_output) TYPE string.

    CLASS-DATA conn_counter TYPE i READ-ONLY.
*  PROTECTED SECTION.
  PRIVATE SECTION.

   DATA carrier_id    TYPE /dmo/carrier_id.
    DATA connection_id TYPE /dmo/connection_id.


ENDCLASS.



CLASS ZCL_LOCAL_CL IMPLEMENTATION.


  METHOD constructor.

    IF i_carrier_id IS INITIAL OR i_connection_id IS INITIAL.
      RAISE EXCEPTION TYPE cx_abap_invalid_value.
    ENDIF.

    me->carrier_id    = i_carrier_id.
    me->connection_id = i_connection_id.

    conn_counter = conn_counter + 1.

  ENDMETHOD.


  METHOD get_output.
    r_output = |Carrier: { carrier_id }, Connection: { connection_id }|.
  ENDMETHOD.
ENDCLASS.
