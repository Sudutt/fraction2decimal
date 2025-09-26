#include <iostream>
#include <string>
#include <sstream>

using namespace std;

int main()
{
    int num, den;
    cin >> num;
    cin >> den;

    // TODO: GCD them both

    // Set up rem_table & quo_table
    // To avoid divisions
    int *rem = new int[den];
    rem[0] = 0;
    int *quo = new int[den];
    quo[0] = 0;
    bool *visited = new bool[den];
    visited[0] = false;

    int quo_i = 0;
    int curr = 0;

    for (int i = 1; i < den; i++)
    {
        curr = curr + 10;
        while (curr >= den)
        {
            curr -= den;
            quo_i++;
        }
        quo[i] = quo_i;
        rem[i] = curr;

        // DEBUG - print the rem table
        // cout << i << " " << curr << endl;
        visited[i] = false;
    }

    // DEBUG - print the quo table
    // for (int ti = 0; ti < den; ti++)
    // {
    //     cout << ti << " " << quo[ti] << endl;
    // }

    // Let's divide - init
    string word;
    stringstream decimals;
    string before_zero;
    string after_zero;
    int remainder, quotient;

    // Let's divide - execute
    before_zero = to_string(num / den);
    remainder = num % den;
    while (remainder > 0)
    {
        // get next quotient digit
        quotient = quo[remainder];
        decimals << to_string(quotient);
        // check if repeat
        if (visited[remainder])
        {
            break;
        }
        visited[remainder] = true;
        // get next remainder
        remainder = rem[remainder];
    }

    // cout << endl;
    // Print
    after_zero = decimals.str();
    if(after_zero.empty()){
        word = before_zero;
    }
    else {
        word = before_zero + "." + after_zero;
    }
    cout << word << endl;

    return 0;
}