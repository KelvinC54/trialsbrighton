<?php

class AgentData extends DataObject {

    private static $db = array(
        'Name' => 'Varchar',
        'Description' => 'Text',
        'NoTelepon' => 'Varchar'
    );

    private static $has_one = array(
        'ProfilePicture' => 'Image',
    );

    private static $many_many = array(
        'Properties' => 'PropertyData',
    );

    private static $summary_fields = array(
        'Name' => 'Name'
    );

    private function addPrefixToTelephone($value)
    {
        // Check if the value doesn't already start with '62'
        if (strpos($value, '62') !== 0) {
            // Prepend '62' to the value
            $value = '62' . $value;
        }
        return $value;
    }

    public function getCMSFields()
    {
        $fields = FieldList::create(TabSet::create('Root'));
        $fields->addFieldsToTab('Root.Main', array(
            TextField::create('Name'),
            TextField::create('NoTelepon', 'Telephone Number')
                ->setAttribute('placeholder', '62XXXXXXXXXX'),
            TextareaField::create('Description', 'Agent description'),
            $upload = UploadField::create(
                'ProfilePicture', ' Profile picture'
            )
        ));

        $upload->getValidator()->setAllowedExtensions(array(
            'png', 'jpg', 'jpeg'
        ));
        $upload->setFolderName('agent-profile-pictures');

        return $fields;
    }

    protected function onBeforeWrite()
    {
        parent::onBeforeWrite();
        $this->NoTelepon = $this->addPrefixToTelephone($this->NoTelepon);
    }

}
