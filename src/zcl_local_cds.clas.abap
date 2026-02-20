CLASS zcl_local_cds DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS constructor
      IMPORTING
        i_carrier_ID    TYPE /dmo/carrier_ID
        i_connection_id TYPE /dmo/connection_id
        i_carrier_name  TYPE /dmo/carrier_name
      RAISING
        cx_abap_invalid_value.

    METHODS get_output
      RETURNING VALUE(r_output) TYPE string_table.

    CLASS-DATA conn_counter TYPE i READ-ONLY.
*  PROTECTED SECTION.
  PRIVATE SECTION.

    DATA carrier_id    TYPE /dmo/carrier_id.
    DATA connection_id TYPE /dmo/connection_id.
    DATA airport_from_id TYPE /dmo/airport_from_id.
    DATA airport_to_id   TYPE /dmo/airport_to_id.
    DATA carrier_name    TYPE /dmo/carrier_name.
ENDCLASS.



CLASS ZCL_LOCAL_CDS IMPLEMENTATION.


  METHOD constructor.

    IF i_carrier_id IS INITIAL OR i_connection_id IS INITIAL OR i_carrier_name IS INITIAL.
      RAISE EXCEPTION TYPE cx_abap_invalid_value.
    ENDIF.

    me->carrier_id = i_carrier_id.
    me->carrier_name = i_carrier_name.
    me->connection_id = i_connection_id.

    SELECT
       AirlineID,
       ConnectionID,
*        DepartureAirport,
*        DestinationAirport,
       \_airline-name AS carrier_name
       FROM zcds_view_sai
       WHERE AirlineID    = @i_carrier_id
       AND ConnectionID = @i_connection_id
          INTO ( @airport_from_id, @airport_to_id, @carrier_name ).
    ENDSELECT.
    IF sy-subrc <> 0.
      RAISE EXCEPTION TYPE cx_abap_invalid_value.
    ENDIF.
  ENDMETHOD.


  METHOD get_output.

    APPEND |--------------------------------|             TO r_output.
    APPEND |Carrier ID:  { carrier_id      }|             TO r_output.
    APPEND |Carrier Name:{ carrier_name    }|             TO r_output.
    APPEND |Connection:  { connection_id   }|             TO r_output.
    APPEND |Departure:   { airport_from_id }|             TO r_output.
    APPEND |Destination: { airport_to_id   }|             TO r_output.

  ENDMETHOD.
ENDCLASS.
