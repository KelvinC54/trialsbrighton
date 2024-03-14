<?php

class PropertyData extends DataObject {

    private static $db = array(
        'Title' => 'Varchar',
        'PricePerNight' => 'Currency',
        'Address' => 'Varchar',
        'AdrressNumber' => 'Varchar',
        'City' => 'Varchar',
        'TransactionType' => 'Varchar',
        'PropertyType' => 'Varchar',
        'Bedrooms' => 'Int',
        'Bathrooms' => 'Int',
        'FeaturedOnHomepage' => 'Boolean',
        'Description' => 'HTMLText',
        'AvailableStart' => 'Date',
        'AvailableEnd'=> 'Date',
        'CustomURLSegment' => 'Varchar'
    );

    private static $has_one = array(
        'PropertiesPage' => 'PropertiesPage',
        'RegionData' => 'RegionData',
        'PrimaryPhoto' => 'Image',
        'Photo2' =>  'Image',
        'Photo3' => 'Image',
        'Photo4' => 'Image',
        'Photo5' => 'Image'
    );


    private static $many_many = array(
        'Agents' => 'AgentData',
        'Facilities' => 'FacilityData'
    );

    private static $summary_fields = array(
        'Title' => 'Title',
        'RegionData.Title' => 'RegionData',
        'PricePerNight.Nice' => 'Price',
        'FeaturedOnHomepage.Nice' => 'Featured?'
    );

    // private static $searchable_fields = array(
    //     'Title',
    //     'Region.Title',
    //     'FeaturedOnHomepage'
    // );

    public function searchableFields()
    {
        return array(
            'Title' => array(
                'filter' => 'PartialMatchFilter',
                'title' => 'Title',
                'field' => 'TextField'
            ),
            'RegionDataID' => array(
                'filter' => 'ExactMatchFilter',
                'title' => 'Region',
                'field' => DropdownField::create('RegionDataID')
                        ->setSource(
                            RegionData::get()->map('ID', 'Title')
                        )
                        ->setEmptyString('-- Any Region --')
            ),
            'FeaturedOnHomepage' => array(
                'filter' => 'ExactMatchFilter',
                'title' => 'Only featured'
            )
        );
    }

    public function getCMSFields()
    {
        $fields = FieldList::create(TabSet::create('Root'));
        $fields->addFieldsToTab('Root.Main', array(
            TextField::create('Title'),
            TextField::create('Address', 'Address')
                ->setAttribute('placeholder', 'Ex: Jl. Mayjend. Jonosewojo Blok D1'),
            TextField::create('AdrressNumber', 'Address Number')
                ->setAttribute('placeholder', 'Ex: 23'),
            TextField::create('City', 'City')
                ->setAttribute('placeholder', 'Ex: Surabaya'),
            CurrencyField::create('PricePerNight', 'Price (per night)'),
            DropdownField::create('TransactionType', 'Transaction Type',
                [
                    'jual' => 'Jual',
                    'beli' => 'Beli',
                    'sewa' => 'Sewa'
                ]
            ),
            DropdownField::create('PropertyType', 'Property Type',
                [
                    'rumah' => 'Rumah',
                    'tanah' => 'Tanah',
                    'apartemen' => 'Apartemen',
                    'gudang' => 'Gudang',
                    'kantor' => 'Kantor'
                ]
            ),
            DropdownField::create('Bedrooms')
                ->setSource(ArrayLib::valuekey(range(1,10))),
            DropdownField::create('Bathrooms','Number of bathrooms')
                ->setSource(ArrayLib::valuekey(range(1,10))),
            DropdownField::create('RegionDataID', 'Region')
                ->setSource(RegionData::get()->map('ID', 'Title'))
                ->setEmptyString('-- please select a region --'),
            CheckboxField::create('FeaturedOnHomepage', 'Feature on hompage'),
            HtmlEditorField::create('Description'),
        ));
        $fields->addFieldsToTab('Root.Photos', array(
            UploadField::create('PrimaryPhoto', ' Primary photo')
            ->setFolderName('property-primary-photos')
            ->setAllowedExtensions(array('png', 'jpg', 'jpeg')),
            UploadField::create('Photo2', ' Photo 2')
            ->setFolderName('property-photos-2')
            ->setAllowedExtensions(array('png', 'jpg', 'jpeg')),
            UploadField::create('Photo3', ' Photo 3')
            ->setFolderName('property-photos-3')
            ->setAllowedExtensions(array('png', 'jpg', 'jpeg')),
            UploadField::create('Photo4', ' Photo 4')
            ->setFolderName('property-photos-4')
            ->setAllowedExtensions(array('png', 'jpg', 'jpeg')),
            UploadField::create('Photo5', ' Photo 5')
            ->setFolderName('property-photos-5')
            ->setAllowedExtensions(array('png', 'jpg', 'jpeg')),
        ));

        $config = GridFieldConfig_RelationEditor::create();
            // ->removeComponentsByType('GridFieldAddNewButton'); // Remove the button for adding new agents
            // ->addComponent(new GridFieldAddExistingAutocompleter('buttons-before-left', [], false)); // Disable the creation of new agents

        $agentsField = new GridField(
            'Agents',
            'Agents',
            $this->Agents(),
            $config
        );

        $facilitiesField = new GridField(
            'Facilities',
            'Facilities',
            $this->Facilities(),
            $config
        );

        $fields->addFieldToTab('Root.Agents', $agentsField);
        $fields->addFieldToTab('Root.Facilities', $facilitiesField);

        return $fields;
    }

    // public function Link() {
    //     return $this->PropertiesPage()->Link(
    //         'find-a-rental/'.$this->ID
    //     );
    // }

    public function Link() {
        // Check if CustomURLSegment is set, otherwise generate it based on the title
        if (!$this->CustomURLSegment) {
            // Get the title and transform it to a URL-friendly format
            $address = $this->Address;
            $urlSegment = preg_replace('/[^a-zA-Z0-9\s]/', '', $address);
            $urlSegment = strtolower(str_replace(' ', '-', $urlSegment));
            // Update the CustomURLSegment field
            $this->CustomURLSegment = $urlSegment;
            $this->write(); // Save the changes
        }
        $data = PropertySearchPage::get()->first();
        return $data->Link('view/'. $this->CustomURLSegment);

        // return $this->RegionsPage()->Link('Show/'.$this->Title);
    }

    // public function LinkingMode() {
    //     return Controller::curr()->getRequest()->param('ID') == $this->ID ? 'current' : 'link';
    // }

    // public function ArticlesLink() {
    //     $page = ArticleHolder::get()->first();

    //     if ($page) {
    //         return $page->Link('region/'. $this->ID);
    //     }
    // }

}
