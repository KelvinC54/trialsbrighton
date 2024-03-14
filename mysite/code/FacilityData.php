<?php

class FacilityData extends DataObject {

    private static $db = array(
        'Title' => 'Varchar',
    );

    private static $has_one = array(
        'Icon' => 'Image',
    );

    private static $belongs_many_many = array(
        'Properties' => 'PropertyData',
    );

    private static $summary_fields = array(
        'Title' => 'Title'
    );

    public function getCMSFields()
    {
        $fields = FieldList::create(TabSet::create('Root'));
        $fields->addFieldsToTab('Root.Main', array(
            TextField::create('Title'),
            $upload = UploadField::create(
                'Icon', ' Icon image'
            )
        ));

        $upload->getValidator()->setAllowedExtensions(array(
            'png', 'jpg', 'jpeg'
        ));
        $upload->setFolderName('facility-icons');

        return $fields;
    }

}
