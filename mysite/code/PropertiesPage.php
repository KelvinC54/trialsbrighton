<?php

class PropertiesPage extends Page {
    // private static $icon = 'mysite/icons/region.png';

    private static $has_many = array(
        'Properties' => 'PropertyData'
    );
    //for CMS page layouting
    private static $can_be_root = false;

    // Prevent creating AgentData directly under any parent
    public function canCreate($member = null, $context = [])
    {
        return false;
    }
}

class PropertiesPage_Controller extends Page_Controller {

    private static $allowed_actions = array(
        'view'
    );


}
