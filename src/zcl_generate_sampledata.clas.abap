CLASS zcl_generate_sampledata DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_generate_sampledata IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

  "delete existing entries in the database table
  DELETE from zdn_guitarist.

  INSERT zdn_guitarist
         from table @( VALUE #(
         ( guitarist_uuid = cl_system_uuid=>create_uuid_x16_static( ) first_name = 'John' last_name = 'Frusciante' country_code = 'US' twitter_handle = 'https://twitter.com/ChiliPeppers' created_by = sy-uname
         created_at = cl_abap_context_info=>get_system_time(  ) )
         ( guitarist_uuid = cl_system_uuid=>create_uuid_x16_static( ) first_name = 'James' last_name = 'Hetfield' country_code = 'US' twitter_handle = 'https://twitter.com/Metallica' created_by = sy-uname created_at = sy-datum )
         ( guitarist_uuid = cl_system_uuid=>create_uuid_x16_static( ) first_name = 'Antonio' last_name = 'Del Negro' country_code = 'DE' twitter_handle = 'https://twitter.com/antoniodelnegro' created_by = sy-uname created_at = sy-datum )

         ) ).
  COMMIT WORK.

 out->write( 'Guitarist demo data inserted.').




  ENDMETHOD.

ENDCLASS.
