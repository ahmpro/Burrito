#include "../rapidxml-1.13/rapidxml.hpp"
#include "../string_helper.hpp"
#include <string>
#include <vector>
#include "festival_filter.hpp"

using namespace std;

FestivalFilter parse_FestivalFilter(rapidxml::xml_attribute<>* input, vector<string> *errors) {
	FestivalFilter festival_filter;
	festival_filter.parse(input, errors);
	return festival_filter;
}
