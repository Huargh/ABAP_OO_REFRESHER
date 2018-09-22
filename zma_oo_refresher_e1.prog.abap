*&---------------------------------------------------------------------*
*& Report zma_oo_refresher_e1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zma_oo_refresher_e1.

CLASS lcl_car DEFINITION.

  PUBLIC SECTION.
    METHODS constructor IMPORTING ip_name      TYPE char30
                                  ip_capacity  TYPE i
                                  ip_fuel_cons TYPE p.
    METHODS drive_distance.
    METHODS get_current_tank_level RETURNING VALUE(rv_tank_level) TYPE ddpercent.
    METHODS refuel RETURNING VALUE(rv_liters_used) TYPE i.

  PRIVATE SECTION.
    DATA mv_name(30) TYPE c.
    DATA mv_tank_cap TYPE i. "in liters
    DATA mv_fuel_cons TYPE p DECIMALS 2. "liters per 100 km
    DATA mv_tank_level TYPE p DECIMALS 2. "in liters

ENDCLASS.

**********************************************************************

CLASS lcl_car IMPLEMENTATION.
  METHOD constructor.

  ENDMETHOD.

  METHOD drive_distance.

  ENDMETHOD.

  METHOD get_current_tank_level.

  ENDMETHOD.

  METHOD refuel.

  ENDMETHOD.

ENDCLASS.

**********************************************************************
START-OF-SELECTION.

  DATA(lr_car1) = NEW lcl_car( ip_name = 'Peugeot 206'
                                  ip_capacity = 50
                                  ip_fuel_cons = 8 ).

  DATA(lr_car2) = NEW lcl_car( ip_name = 'Fiat Punto'
                               ip_capacity = 55
                               ip_fuel_cons = 10 ).

  DATA(lr_car3) = NEW lcl_car( ip_name = 'BMW 1'
                               ip_capacity = 65
                               ip_fuel_cons = 20 ).
