REPORT yteste.

PARAMETERS: p_n TYPE i.

CLASS lcl_fibonacci DEFINITION.

  PUBLIC SECTION.
    METHODS:
      constructor,
      calculate_fibonacci IMPORTING iv_n TYPE i RETURNING VALUE(rv_result) TYPE i,
      print_fibonacci IMPORTING iv_n TYPE i.

ENDCLASS.

CLASS lcl_fibonacci IMPLEMENTATION.

  METHOD constructor.
  ENDMETHOD.

  METHOD calculate_fibonacci.

    IF iv_n = 0.
      rv_result = 0.
    ELSEIF iv_n = 1.
      rv_result = 1.
    ELSE.
      rv_result = me->calculate_fibonacci( iv_n = iv_n - 1 ) + me->calculate_fibonacci( iv_n = iv_n - 2 ).
    ENDIF.

  ENDMETHOD.

  METHOD print_fibonacci.

    DATA: lv_result  TYPE i,
          lv_counter TYPE i.

    WRITE: / 'Sequência de Fibonacci: '.

    DO iv_n TIMES.
      lv_result = me->calculate_fibonacci( iv_n = lv_counter ).
      WRITE: / lv_result.
      lv_counter = lv_counter + 1.
    ENDDO.

  ENDMETHOD.

ENDCLASS.

START-OF-SELECTION.

  DATA(lo_fibonacci) = NEW lcl_fibonacci( ).
  lo_fibonacci->print_fibonacci( p_n ).
