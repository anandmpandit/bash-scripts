#!/usr/bin/env bash
START=1
END=10

echo 'Generating random Mach-O binaries'
for ((n=$START; n<=$END; n++))
do
	#Generating 12 letter random string 
    STATEMENT=$(dd if=/dev/urandom count=1 2> /dev/null | uuencode -m - | sed -ne 2p | cut -c-12)
    cat > randomMachoGenerator.cpp << EOF
    
#include <iostream>
using namespace std;
int main() {
    cout << "${STATEMENT}"<< endl;
    return 0;
}
EOF
    g++ randomMachoGenerator.cpp -o Random_macho${n}
    #execute the binaries built in above step
    ./Random_macho${n}
done