<?php

class RegionsPage extends Page {
    private static $icon = 'mysite/icons/region.png';

    private static $has_many = array(
        'Regions' => 'RegionData',
    );

    //for CMS page layouting
    private static $can_be_root = false;

    public function getCMSFields()
    {
        $fields = parent::getCMSFields();
        $fields->addFieldToTab('Root.Regions', GridField::create(
            'Regions',
            'Regions on this page',
            $this->Regions(),
            GridFieldConfig_RecordEditor::create()
        ));

        return $fields;
    }

    // Prevent creating AgentData directly under any parent
    public function canCreate($member = null, $context = [])
    {
        return false;
    }

}

class RegionsPage_Controller extends Page_Controller {

    private static $allowed_actions = array(
        'show'
    );

    public function show(SS_HTTPRequest $request){
        // $region =  RegionData::get()->byID($request->param('ID'));
        $urlSegment = $request->param('ID');

        $region = RegionData::get()->filter('CustomURLSegment', $urlSegment)->first();

        if(!$region) {
            return $this->httpError(404, 'That region could not be shown.');
        }

        return array(
            'Region' => $region,
            'Title' =>  $region->Title
        );
    }

}
