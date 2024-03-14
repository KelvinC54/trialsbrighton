<?php

class PropertySearchPage extends Page
{

}

class PropertySearchPage_Controller extends Page_Controller
{

    private static $allowed_actions = array(
        'PropertySearchForm',
        'view'
    );

    public function index(SS_HTTPRequest $request)
    {
        $properties = PropertyData::get();

        $filters = ArrayList::create();

        if ($search = $request->getVar('Title')) {
            $filters->push(ArrayData::create(array(
                'Label' => "Title: '$search'",
                'RemoveLink' => HTTP::setGetVar('Title',null)
            )));
            $properties = $properties->filter(array(
                'Title:PartialMatch' => $search
            ));
        }

        if ($search = $request->getVar('Address')) {
            $filters->push(ArrayData::create(array(
                'Label' => "Address: '$search'",
                'RemoveLink' => HTTP::setGetVar('Address',null)
            )));
            $properties = $properties->filter(array(
                'Address:PartialMatch' => $search
            ));
        }

        if ($search = $request->getVar('City')) {
            $filters->push(ArrayData::create(array(
                'Label' => "City: '$search'",
                'RemoveLink' => HTTP::setGetVar('City',null)
            )));
            $properties = $properties->filter(array(
                'City:PartialMatch' => $search
            ));
        }

        if ($search = $request->getVar('TransactionType')) {
            $filters->push(ArrayData::create(array(
                'Label' => "TransactionType: '$search'",
                'RemoveLink' => HTTP::setGetVar('TransactionType',null)
            )));
            $properties = $properties->filter(array(
                'TransactionType' => $search
            ));
        }

        if ($search = $request->getVar('PropertyType')) {
            $filters->push(ArrayData::create(array(
                'Label' => "PropertyType: '$search'",
                'RemoveLink' => HTTP::setGetVar('PropertyType',null)
            )));
            $properties = $properties->filter(array(
                'PropertyType' => $search
            ));
        }

        if ($bedrooms = $request->getVar('Bedrooms')) {
            $filters->push(ArrayData::create(array(
                'Label' => "$bedrooms bedrooms",
                'RemoveLink' => HTTP::setGetVar('Bedrooms',null)
            )));
            $properties = $properties->filter(array(
                'Bedrooms:GreaterThanOrEqual' => $bedrooms
            ));
        }

        if ($bathrooms = $request->getVar('Bathrooms')) {
            $filters->push(ArrayData::create(array(
                'Label' => "$bathrooms bathrooms",
                'RemoveLink' => HTTP::setGetVar('Bathrooms',null)
            )));
            $properties = $properties->filter(array(
                'Bathrooms:GreaterThanOrEqual' => $bathrooms
            ));
        }

        if ($minPrice = $request->getVar('MinPrice')) {
            $filters->push(ArrayData::create(array(
                'Label' => "Min. \$$minPrice",
                'RemoveLink' => HTTP::setGetVar('MinPrice', null)
            )));
            $properties = $properties->filter(array(
                'PricePerNight:GreaterThanOrEqual' => $minPrice
            ));
        }

        if ($maxPrice = $request->getVar('MaxPrice')) {
            $filters->push(ArrayData::create(array(
                'Label' => "Max. \$$maxPrice",
                'RemoveLink' => HTTP::setGetVar('MaxPrice', null)
            )));
            $properties = $properties->filter(array(
                'PricePerNight:LessThanOrEqual' => $maxPrice
            ));
        }

        $paginatedProperties = PaginatedList::create($properties, $request)
            ->setPageLength(7)
            ->setPaginationGetVar('p');

        $data = array(
            'Results' => $paginatedProperties,
            'ActiveFilters' => $filters
        );

        if ($request->isAjax()) {
            return $this->customise($data)->renderWith('PropertySearchResults');
        }

        return $data;
    }

    public function PropertySearchForm()
    {
        $nights = array();
        foreach (range(1, 14) as $i) {
            $nights[$i] = "$i night" . (($i > 1) ? 's' : '');
        }
        $prices = array();
        foreach (range(100, 1000, 50) as $i) {
            $prices[$i] = '$' . $i;
        }

        $form = Form::create(
            $this,
            'PropertySearchForm',
            FieldList::create(
                LiteralField::create('TitleHolder', '<div class="form-field"><div class="form-field-inner">'),
                TextField::create('Title')
                    ->setAttribute('placeholder', 'Property title')
                    ->addExtraClass('form-control'),
                LiteralField::create('TitleHolderEnd', '</div></div>'),

                LiteralField::create('AddressHolder', '<div class="form-field"><div class="form-field-inner">'),
                TextField::create('Address')
                    ->setAttribute('placeholder', 'Property address')
                    ->addExtraClass('form-control'),
                LiteralField::create('AddressHolderEnd', '</div></div>'),

                LiteralField::create('CityHolder', '<div class="form-field"><div class="form-field-inner">'),
                TextField::create('City')
                    ->setAttribute('placeholder', 'Property city')
                    ->addExtraClass('form-control'),
                LiteralField::create('CityHolderEnd', '</div></div>'),

                LiteralField::create('TransactionTypeHolder', '<div class="form-field"><div class="form-field-inner">'),
                DropdownField::create('TransactionType', 'Transaction Type',
                    [
                        'jual' => 'Jual',
                        'beli' => 'Beli',
                        'sewa' => 'Sewa'
                    ])
                    ->setEmptyString('-- any --')
                    ->addExtraClass('form-control'),
                LiteralField::create('TransactionTypeEnd', '</div></div>'),

                LiteralField::create('PropertyTypeHolder', '<div class="form-field"><div class="form-field-inner">'),
                DropdownField::create('PropertyType', 'Property Type',
                    [
                        'rumah' => 'Rumah',
                        'tanah' => 'Tanah',
                        'apartemen' => 'Apartemen',
                        'gudang' => 'Gudang',
                        'kantor' => 'Kantor'
                    ])
                    ->setEmptyString('-- any --')
                    ->addExtraClass('form-control'),
                LiteralField::create('PropertyTypeEnd', '</div></div>'),

                LiteralField::create('BedroomsHolder', '<div class="form-field"><div class="form-field-inner">'),
                DropdownField::create('Bedrooms')
                    ->setEmptyString('-- any --')
                    ->setSource(ArrayLib::valuekey(range(1, 5)))
                    ->addExtraClass('form-control'),
                LiteralField::create('BedroomsHolderEnd', '</div></div>'),

                LiteralField::create('BathroomsHolder', '<div class="form-field"><div class="form-field-inner">'),
                DropdownField::create('Bathrooms')
                    ->setEmptyString('-- any --')
                    ->setSource(ArrayLib::valuekey(range(1, 5)))
                    ->addExtraClass('form-control'),
                LiteralField::create('BathroomsHolderEnd', '</div></div>'),

                LiteralField::create('MinPriceHolder', '<div class="form-field"><div class="form-field-inner">'),
                DropdownField::create('MinPrice', 'Min. price')
                    ->setEmptyString('-- any --')
                    ->setSource($prices)
                    ->addExtraClass('form-control'),
                LiteralField::create('MinPriceHolderEnd', '</div></div>'),

                LiteralField::create('MaxPriceHolder', '<div class="form-field"><div class="form-field-inner">'),
                DropdownField::create('MaxPrice', 'Max. price')
                    ->setEmptyString('-- any --')
                    ->setSource($prices)
                    ->addExtraClass('form-control'),
                LiteralField::create('MaxPriceHolderEnd', '</div></div>')
            ),
            FieldList::create(
                FormAction::create('doPropertySearch', 'Search')
                    ->addExtraClass('btn-lg btn-fullcolor')
            )
        );

        $form->setFormMethod('GET')
            ->setFormAction($this->Link())
            ->disableSecurityToken()
            ->loadDataFrom($this->request->getVars());

        return $form;
    }

    public function view(SS_HTTPRequest $request){
        // $property =  PropertyData::get()->byID($request->param('ID'));
        $urlSegment = $request->param('ID');

        $property = PropertyData::get()->filter('CustomURLSegment', $urlSegment)->first();

        $agents = $property->Agents();

        $facilities = $property->Facilities();

        if(!$property) {
            return $this->httpError(404, 'That property could not be shown.');
        }

        $data = array(
            'Property' => $property,
            'Agents' => $agents,
            'Facilities' => $facilities
        );

        // print_r($data);
        // die;

        return $this->customise($data)->renderWith(array('PropertiesPage_view', 'Page'));
    }
}
