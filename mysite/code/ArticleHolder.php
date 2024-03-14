<?php

Class ArticleHolder extends Page {

    private static $icon = 'mysite/icons/articles_holder.png';

    private static $has_many = array(
        'Categories' => 'ArticleCategoryData'
    );

    private static $allowed_children = array(
        'ArticlePage'
    );

    public function getCMSFields()
    {
        $fields = parent::getCMSFields();
        $fields->addFieldToTab('Root.Categories', GridField::create(
            'Category',
            'Article categories',
            $this->Categories(),
            GridFieldConfig_RecordEditor::create()
        ));

        return $fields;
    }

    public function Regions() {
        $page = RegionsPage::get()->first();

        if($page) {
            return $page->Regions();
        }
    }

    public function ArchiveDates() {
        $list = ArrayList::create();
        $stage = Versioned::current_stage();

        $query = new SQLQuery(array ());
        $query->selectField("DATE_FORMAT(`Date`,'%Y_%M_%m')","DateString")
              ->setFrom("ArticlePage_{$stage}")
              ->setOrderBy("Date", "ASC")
              ->setDistinct(true);

        $result = $query->execute();

        if($result) {
            while($record = $result->nextRecord()) {
                list($year, $monthName, $monthNumber) = explode('_', $record['DateString']);

                $list->push(ArrayData::create(array(
                    'Year' => $year,
                    'MonthName' => $monthName,
                    'MonthNumber' => $monthNumber,
                    'Link' => $this->Link("date/$year/$monthNumber"),
                    'ArticleCount' => ArticlePage::get()->where("
                            DATE_FORMAT(`Date`,'%Y_%m') = '{$year}_{$monthNumber}'
                            AND ParentID = {$this->ID}
                        ")->count()
                )));
            }
        }

        return $list;
    }
}

Class  ArticleHolder_Controller extends Page_Controller {

    private static $allowed_actions = array(
        'category',
        'region',
        'date'
    );

    protected $articleList;

    public function init() {
        parent::init();

        $this->articleList = ArticlePage::get()->filter(array(
            'ParentID' => $this->ID
        ))->sort('Date DESC');
    }

    public function category(SS_HTTPRequest $request) {
        $category = ArticleCategoryData::get()->byID(
            $request->param('ID')
        );

        if(! $category) {
            return $this->httpError(404, 'Category Not Found!');
        }

        $this->articleList = $this->articleList->filter(array(
            'Categories.ID' => $category->ID
        ));

        return array(
            'SelectedCategory' => $category
        );
    }

    public function region(SS_HTTPRequest $request) {
        $region = RegionData::get()->byID(
            $request->param('ID')
        );

        if(!$region) {
            return $this->httpError(404,'That region was not found');
        }

        $this->articleList = $this->articleList->filter(array(
            'RegionID' => $region->ID
        ));

        return array (
            'SelectedRegion' => $region
        );
    }

    public function date(SS_HTTPRequest $request) {
        $year = $request->param('ID');
        $month = $request->param('OtherID');

        if (! $year) {
            return $this->httpError(404);
        }

        $startDate = $month ? "{$year}-{$month}-01" : "{$year}-01-01";

        if(strtotime($startDate) === false) {
            return $this->httpError(404, 'Invalid date');
        }

        $adder = $month ? '+1 month' : '+1 year';
        $endDate = date('Y-m-d', strtotime(
                        $adder,
                        strtotime($startDate)
                    ));

        $this->articleList = $this->articleList->filter(array(
            'Date:GreaterThanOrEqual' => $startDate,
            'Date:LessThan' => $endDate
        ));

        return array (
            'StartDate' => DBField::create_field('SS_DateTime', $startDate),
            'EndDate' => DBField::create_field('SS_DateTime', $endDate)
        );
    }

    public function PaginatedArticles($num = 10) {
        return PaginatedList::create(
            $this->articleList,
            $this->getRequest()
        )->setPageLength($num);
    }

}
