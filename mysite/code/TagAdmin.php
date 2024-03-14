<?php

class TagAdmin extends ModelAdmin {

    private static $menu_title = 'Articles Tags';

    private static $url_segment = 'tags';

    private static $managed_models = array(
        'TagData'
    );

    private static $menu_icon = 'mysite/icons/tags.png';

}
