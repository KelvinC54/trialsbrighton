<?php

class TagData extends DataObject {

    private static $db = array(
        'Title' => 'Varchar',
        'CustomURLSegment' => 'Varchar'
    );

    private static $has_one = array(
        'ArticleHolder' => 'ArticleHolder'
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

    public function Link() {
        // Check if CustomURLSegment is set, otherwise generate it based on the title
        if (!$this->CustomURLSegment) {
            // Get the title and transform it to a URL-friendly format
            $title = $this->Title;
            $urlSegment = preg_replace('/[^a-zA-Z0-9\s]/', '', $title);
            $urlSegment = strtolower(str_replace(' ', '-', $urlSegment));
            // Update the CustomURLSegment field
            $this->CustomURLSegment = $urlSegment;
            $this->write(); // Save the changes
        }
        $data = ArticlePage::get()->first();
        return $data->Link('tag/'. $this->CustomURLSegment);

        // return $this->RegionsPage()->Link('Show/'.$this->Title);
    }
}
