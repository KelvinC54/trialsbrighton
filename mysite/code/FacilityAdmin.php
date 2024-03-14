<?php

class FacilityAdmin extends ModelAdmin {

    private static $menu_title = 'Facilities';

    private static $url_segment = 'facilities';

    private static $managed_models = array(
        'FacilityData'
    );

    private static $menu_icon = 'mysite/icons/facilities.png';

}
