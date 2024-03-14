<?php

class RegionData extends DataObject {
    private static $db = array(
        'Title' => 'Varchar',
        'Description' => 'HTMLText',
        'CustomURLSegment' => 'Varchar'
    );

    private static $has_one = array(
        'Photo' => 'Image',
        'RegionsPage' => 'RegionsPage',
    );

    private static $has_many = array (
        'Articles' => 'ArticlePage'
    );

    // private static $summary_fields = array(
    //     'Photo.CMSThumbnail' => '',
    //     'Title' => 'Title of region',
    //     'Description' => 'Short description',
    // );

    private static $summary_fields = array(
        'GridThumbnail' => 'Photo',
        'Title' => 'Title of Region',
        'Description' => 'Short Description',
    );

    public function getGridThumbnail() {
        if($this->Photo()->exists()) {
            return $this->Photo()->SetWidth(100);
        }
        return '(no image)';
    }

    public function getCMSFields()
    {
        $fields = FieldList::create(
            TextField::create('Title'),
            HtmlEditorField::create('Description'),
            $uploader = UploadField::create('Photo')
        );

        $uploader->setFolderName('region-photos');
        $uploader->getValidator()->setAllowedExtensions(array('png','gif','jpeg','jpg'));

        return $fields;
    }

    public function Link() {
        // Check if CustomURLSegment is set, otherwise generate it based on the title
        if (!$this->CustomURLSegment) {
            // Get the title and transform it to a URL-friendly format
            $title = $this->Title;
            $urlSegment = strtolower(str_replace(' ', '-', $title));
            // Update the CustomURLSegment field
            $this->CustomURLSegment = $urlSegment;
            $this->write(); // Save the changes
        }
        return $this->RegionsPage()->Link('show/'. $this->CustomURLSegment);

        // return $this->RegionsPage()->Link('Show/'.$this->Title);
    }

    public function LinkingMode() {
        return Controller::curr()->getRequest()->param('ID') == $this->ID ? 'current' : 'link';
    }

    public function ArticlesLink() {
        $page = ArticleHolder::get()->first();

        if ($page) {
            return $page->Link('region/'. $this->ID);
        }
    }
}
