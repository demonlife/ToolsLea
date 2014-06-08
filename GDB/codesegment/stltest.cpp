#include <iostream>
#include <map>
#include <string>

using namespace std;

int main(void) {
  map<int, string> mapExample;
  mapExample.insert(pair<int, string>(1, "demon_one"));
  mapExample.insert(pair<int, string>(2, "demon_two"));
  mapExample.insert(pair<int, string>(3, "demon_three"));

  map<int, string>::iterator iter;
  for (iter = mapExample.begin(); iter != mapExample.end(); iter++) {
    cout<<iter->second<<endl;
  }
  return 0;
}
