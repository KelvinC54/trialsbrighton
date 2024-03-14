<?php

class ArticlePage extends Page {

    private static $icon = 'mysite/icons/article.png';

    private static $db = array(
        'Date' => 'Date',
        'Teaser' => 'Text',
        'Author' => 'Varchar',
    );

    private static $has_one = array (
        'Photo' => 'Image',
        'Brochure' => 'File',
        'Region' => 'RegionData'
    );

    private static $many_many = array(
        'Categories' => 'ArticleCategoryData',
        'Tags'       => 'TagData'
    );

    private static $has_many = array(
        'Comments' => 'ArticleCommentData'
    );

    //for CMS page layouting
    private static $can_be_root = false;

    public function getCMSFields()
    {
        $fields = parent::getCMSFields();

        $fields->addFieldToTab('Root.Main', DateField::create('Date','Date of article')
            ->setConfig('showcalendar', true)
        ,'Content');
        $fields->addFieldToTab("Root.Main", TextareaField::create('Teaser'),'Content');
        $fields->addFieldToTab("Root.Main", TextField::create('Author', 'Author of article')
            ->setDescription('If multiple authors, separate with commas')
            ->setMaxLength(50)
        ,'Content');

        $fields->addFieldToTab('Root.Main', DropdownField::create(
            'RegionID',
            'Region',
            RegionData::get()->map('ID','Title')
        )->setEmptyString('-- None --'), 'Content');

        $fields->addFieldToTab("Root.Attachments", $photo = UploadField::create('Photo'));
        $fields->addFieldToTab("Root.Attachments", $brochure = UploadField::create('Brochure', 'Travel Brochure, optional (PDF only)'));

        $photo->getValidator()->setAllowedExtensions(array('png', 'gif', 'jpg', 'jpeg'));
        $photo->setFolderName('travel-photos');

        $brochure->getValidator()->setAllowedExtensions(array('pdf'));
        $brochure->setFolderName('travel-brochures');

        $fields->addFieldToTab('Root.Categories', CheckboxSetField::create(
            'Categories',
            'Selected categories',
            $this->Parent()->Categories()->map('ID', 'Title')
        ));

        $config = GridFieldConfig_RelationEditor::create();
            // ->removeComponentsByType('GridFieldAddNewButton'); // Remove the button for adding new agents
            // ->addComponent(new GridFieldAddExistingAutocompleter('buttons-before-left', [], false)); // Disable the creation of new agents

        $tagsField = new GridField(
            'Tags',
            'Tags',
            $this->Tags(),
            $config
        );

        $fields->addFieldToTab('Root.Tags', $tagsField);

        return $fields;
    }

    public function CategoriesList() {
        if($this->Categories()->exists()) {
            return implode(', ', $this->Categories()->column('Title'));
        }
    }

    public function TagsList() {
        if($this->Tags()->exists()) {
            return $this->Tags();
        }
    }

}

class ArticlePage_Controller extends Page_Controller{

    private static $allowed_actions = array(
        'CommentForm',
        'CommentDo'
    );

    public function CommentForm(){
        $form = Form::create(
            $this,
            __FUNCTION__,
            FieldList::create(
                TextField::create('Name',''),
                EmailField::create('Email',''),
                TextareaField::create('Comment','')
            ),
            FieldList::create(
                FormAction::create('CommentDo','Post Comment')
                    ->setUseButtonTag(true)
                    ->addExtraClass('btn btn-default-color btn-lg')
            ),
            RequiredFields::create('Name','Email','Comment')
        )->addExtraClass('form-style');

        foreach($form->Fields() as $field) {
            $field->addExtraClass('form-control')
                ->setAttribute('placeholder',$field->getName().'*');
        }

        $data = Session::get("FormData.{$form->getName()}.data");

        return $data ? $form->loadDataFrom($data) : $form;
    }

    public function CommentDo($data, $form) {
        Session::set("FormData.{$form->getName()}.data", $data);

        // Convert::raw2sql
        $existing = $this->Comments()->filter(array(
            // 'Comment' => $data[ 'Comment']
            'Comment' => Convert::raw2sql($data[ 'Comment'])
        ));
        // if($existing->exists() && strlen($data['Comment']) > 20) {
        if($existing->exists() && strlen(Convert::raw2sql($data[ 'Comment'])) > 20) {
            $form->sessionMessage('That comment already exists! Please dont spam!', 'bad');

            return $this->redirectBack();
        }

        $comment = ArticleCommentData::create();
        $comment->ArticlePageID = $this->ID;
        $form->saveInto($comment);
        $comment->write();

        Session::clear("FormData.{$form->getName()}.data");
        $form->sessionMessage('Thanks for your comment', 'good');

        return $this->redirectBack();
    }

    // public function CommentDo($data, $form) {
    //     $comment = ArticleComment::create();
    //     $comment->Name = $data[ 'Name'] ;
    //     $comment->Email= $data['Email'];
    //     $comment->Comment = $data['Comment'];
    //     $comment->ArticlePageID = $this->ID;
    //     $comment->write();

    //     $form->sessionMessage('Thanks for your comment', 'good');

    //     return $this->redirectBack();
    // }

}
