<?php

//Model
class HomePage extends Page {

}

//Controller
class HomePage_Controller extends Page_Controller {

    public function LatestArticles($count = 3) {
        return ArticlePage::get()
            ->sort('Created', 'DESC')
            ->limit($count);
    }

    public function FeaturedProperties(){
        return PropertyData::get()
            ->filter(array(
                'FeaturedOnHomePage' => true
            ))
            ->limit(6);
    }
}
