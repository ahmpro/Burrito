#pragma once

#include "../rapidxml-1.13/rapidxml.hpp"
#include "filter.hpp"


using namespace std;

class RaceFilter: public Filter {
public:
	FILTER_ITEM(asura, "asura")
	FILTER_ITEM(charr, "charr")
	FILTER_ITEM(human, "human")
	FILTER_ITEM(norn, "norn")
	FILTER_ITEM(sylvari, "sylvari")

    virtual string classname() { return "RaceFilter"; }
};

RaceFilter parse_RaceFilter(rapidxml::xml_attribute<>* input, vector<string> *errors);
