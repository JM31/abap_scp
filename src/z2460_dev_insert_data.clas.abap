CLASS z2460_dev_insert_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS Z2460_DEV_INSERT_DATA IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    "CTRL+ALT+DOWN
    DATA:
      lt_travel   TYPE TABLE OF z2460_trave_jcor,
      lt_booking  TYPE TABLE OF z2460_boo_jcor,
      lt_book_sup TYPE TABLE OF z2460_sbo_jcor.


    SELECT travel_id, agency_id, customer_id , begin_date,
           end_date, booking_fee, total_price, currency_code,
           description, status AS overall_status, createdby AS created_by,
           createdat AS created_at, lastchangedby AS last_changed_by, lastchangedat AS last_changed_at
        FROM /dmo/travel
    INTO CORRESPONDING FIELDS OF TABLE @lt_travel
    UP TO 50 ROWS.

    SELECT * FROM /dmo/booking INTO CORRESPONDING FIELDS OF TABLE @lt_booking.

    SELECT * FROM /dmo/book_suppl INTO CORRESPONDING FIELDS OF TABLE @lt_book_sup.

    DELETE FROM:
          z2460_trave_jcor,
          z2460_sbo_jcor,
          z2460_boo_jcor.

    " SHIFT+ALT+A
    INSERT:
           Z2460_TRAVE_JCOR FROM TABLE @lt_travel,
           Z2460_SBO_JCOR FROM TABLE @lt_book_sup,
           Z2460_BOO_JCOR FROM TABLE @lt_booking.

    out->write( sy-dbcnt ).
    out->write( 'Done!' ).

  ENDMETHOD.
ENDCLASS.
