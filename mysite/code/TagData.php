<?php

class TagData extends DataObject {

    private static $db = array(
        'Title' => 'Varchar',
    );

    private static $belongs_many_many = array(
        'ArticlesPage' => 'ArticlePage'
    );

    private static $summary_fields = array(
        'Title' => 'Title'
    );

    public function getCMSFields()
    {
        $fields = FieldList::create(TabSet::create('Root'));
        $fields->addFieldsToTab('Root.Main', array(
            TextField::create('Title')
        ));

        return $fields;
    }
}
