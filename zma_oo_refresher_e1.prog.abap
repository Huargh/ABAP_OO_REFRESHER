*&---------------------------------------------------------------------*
*& Report zma_oo_refresher_e1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zma_oo_refresher_e1.

TYPES ty_liters TYPE p DECIMALS 2.

CLASS lcl_car DEFINITION.

  PUBLIC SECTION.
    METHODS constructor IMPORTING ip_name      TYPE char30
                                  ip_capacity  TYPE ty_liters
                                  ip_fuel_cons TYPE ty_liters.
    METHODS drive_distance IMPORTING ip_distance TYPE i. "no. of km
    METHODS get_current_tank_level RETURNING VALUE(rv_tank_level) TYPE ddpercent.
    METHODS refuel RETURNING VALUE(rv_liters_used) TYPE ty_liters.

  PRIVATE SECTION.
    DATA mv_name(30) TYPE c.
    DATA mv_tank_cap TYPE ty_liters. "in liters
    DATA mv_fuel_cons TYPE p DECIMALS 2. "liters per 100 km
    DATA mv_tank_level TYPE p DECIMALS 2. "in liters

ENDCLASS.

**********************************************************************

CLASS lcl_car IMPLEMENTATION.
  METHOD constructor.
    mv_name = ip_name.
    mv_tank_cap = ip_capacity.
    mv_fuel_cons = ip_fuel_cons.
    mv_tank_level = ip_capacity. "Cars come with full tank
  ENDMETHOD.

  METHOD drive_distance.

    mv_tank_level = mv_tank_level - ip_distance * mv_fuel_cons / 100.

  ENDMETHOD.

  METHOD get_current_tank_level.

    rv_tank_level = mv_tank_level / mv_tank_cap.

  ENDMETHOD.

  METHOD refuel.

    rv_liters_used = mv_tank_cap - mv_tank_level.
    mv_tank_level = mv_tank_cap.

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

  lr_car1->drive_distance( 100  ).
  cl_demo_output=>display( |'Fuel Level: { lr_car1->get_current_tank_level( ) }| ).
  lr_car1->refuel( ).
