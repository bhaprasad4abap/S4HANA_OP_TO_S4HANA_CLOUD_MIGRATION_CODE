CLASS zcl_material_information_C17 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS get_material_art
      IMPORTING
        matnr               TYPE i_product-product
      RETURNING
        VALUE(material_art) TYPE i_product-producttype.
ENDCLASS.

CLASS zcl_material_information_C17 IMPLEMENTATION.

  METHOD get_material_art.
    DATA material TYPE i_product.
    DATA production_date TYPE datn.
    DATA bool_tmp TYPE abap_boolean.

    production_date = cl_abap_context_info=>get_system_date(  ).


* Quick Fix Replace 'OLD SQL' with NEW SQL.
* 03/14/2024 04:24:24 STUDENTC17
* Transport S4HK902836 STUDENTC17 TR IN S4H-OP
* Replaced Code:
*    SELECT SINGLE mtart FROM i_product INTO CORRESPONDING FIELDS OF material WHERE matnr = matnr.

SELECT SINGLE FROM i_product FIELDS producttype WHERE product = @matnr INTO CORRESPONDING FIELDS OF @material .
    material_art = material-producttype.

* End of Quick Fix



* Quick Fix Replace MOVE with an assignment.
* 03/14/2024 04:24:24 STUDENTC17
* Transport S4HK902836 STUDENTC17 TR IN S4H-OP
* Replaced Code:
*    MOVE material-mtart TO material_art.

material_art = material-producttype.

* End of Quick Fix


  ENDMETHOD.


  METHOD if_oo_adt_classrun~main.
    DATA material_info TYPE REF TO zcl_material_information_C17.
    material_info = NEW zcl_material_information_C17(  ).
    DATA(material_art) = material_info->get_material_art( 'RM34' ).
    out->write( material_art ).
  ENDMETHOD.
ENDCLASS.

