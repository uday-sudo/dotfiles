return {
  "L3MON4D3/LuaSnip",
  opts = function(_, opts)
    local ls = require("luasnip")
    local s = ls.snippet
    local t = ls.text_node
    local i = ls.insert_node
    local extras = require("luasnip.extras")
    local rep = extras.rep -- Repeat cursor at multiple places
    local fmt = require("luasnip.extras.fmt").fmt -- Format string so you don't have to use multile nodes.
    --local c = ls.choice_node -- Give multiple choices inside a node
    --local f = ls.function_node -- use a function that returns a string
    --local d = ls.dynamic_node -- Returns a whole snippet instead of a string, just like function node
    --local sn = ls.snippet_node --

    ls.add_snippets("all", {
      s("ternary", {
        -- equivalent to "${1:cond} ? ${2:then} : ${3:else}"
        i(1, "cond"),
        t(" ? "),
        i(2, "then"),
        t(" : "),
        i(3, "else"),
      }),
    })

    ls.add_snippets("cpp", {
      s({ trig = "swap-func" }, fmt(
        [[
        void swap({a} &x,{b} &y){{
          {b} temp = y;
          y = x;
          x = temp;
        }}
        {c}
        ]],
        { a = i(1,"type"), b = rep(1), c = i(0)}
      )),
      s({ trig = "dectobinstring-func" }, fmt(
        [[
        string dectobin({} n) {{
            string s = bitset<64> (n).to_string();
            const auto loc1 = s.find('1');
            if(loc1 != string::npos)
                return s.substr(loc1);
            return "0";
        }}{}
        ]],
        { i(1, "int"), i(0) }
      )),
      s({ trig = "compe-template" }, fmt(
        [[
        #pragma GCC optimize("O3")
        #include <bits/stdc++.h>
        #define adj_list vector<vi>
        #define endl "\n"
        #define spc " "
        #define INF_INT 2e9
        #define INF_LL 2e18
        #define matmax 25
        #define mod 1000000007
        #define mp make_pair
        #define pb push_back
        #define pi pair<int, int>
        #define pip pair<int,pi>
        #define pl pair<ll,ll>
        #define plp pair<ll,pl>
        #define vi vector<int>
        #define vl vector<ll>
        #define fastio ios::sync_with_stdio(false); cin.tie(0); cout.tie(0);
        #define all(x) x.begin(), x.end()
        #define ins insert
        #define lb lower_bound  // First element NOT LESS than val
        #define ub upper_bound  // First element GREATER than val
        #define sz(q) (int)(q.size())
        
        using namespace std;
        typedef long long int ll;
        typedef long int li;
        
        #define ook order_of_key  // Number of elements STRICTLY smaller than X
        #define fbo find_by_order  //  *ITERATOR* pointing to the kth element (0 order)
        
        #define fo(a,b) for(auto i=a;i<b;++i)
        #define nfo(a,b) for(auto i=a;i>=b;--i)
        #define jfo(a,b) for(auto j=a;j<b;++j)
        #define njfo(a,b) for(auto j=a;j>=b;--j)
        #define tt ll t; cin>>t; while(t--)

        int main() {{
            {}
        }}
        ]],
        {i(0)}
      )),
      s({ trig = "gcd-func" }, fmt(
        [[
        {} gcd({} a, {} b) {{ 
            if (a == 0) 
                return b; 
            if (b == 0) 
                return a; 
          
            if (a == b) 
                return a; 
          
            if (a > b) 
                return gcd(a - b, b); 
            return gcd(a, b - a); 
        }}{}
        ]],
        { i(1, "int"), rep(1), rep(1), i(0) }
      )),
      s({ trig = "notest-compe" }, fmt(
        [[
        #pragma GCC optimize("O3")
        #include <bits/stdc++.h>
        #define adj_list vector<vi>
        #define endl "\n"
        #define spc " "
        #define mp make_pair
        #define pb push_back
        #define pi pair<int, int>
        #define pip pair<int,pi>
        #define pl pair<ll,ll>
        #define plp pair<ll,pl>
        #define vi vector<int>
        #define vl vector<ll>
        #define fastio ios::sync_with_stdio(false); cin.tie(0); cout.tie(0);
        #define all(x) x.begin(), x.end()
        #define ins insert
        #define sz(q) (int)(q.size())
        
        using namespace std;
        typedef long long int ll;
        typedef long int li;
        
        #define tt ll t; cin>>t; while(t--)

        int main() {{
            {}
        }}
        ]],
        { i(0) }
      )),
      s({ trig = "test-compe" }, fmt(
        [[
        #pragma GCC optimize("O3")
        #include <bits/stdc++.h>
        #define adj_list vector<vi>
        #define endl "\n"
        #define spc " "
        #define mp make_pair
        #define pb push_back
        #define pi pair<int, int>
        #define pip pair<int,pi>
        #define pl pair<ll,ll>
        #define plp pair<ll,pl>
        #define vi vector<int>
        #define vl vector<ll>
        #define fastio ios::sync_with_stdio(false); cin.tie(0); cout.tie(0);
        #define all(x) x.begin(), x.end()
        #define ins insert
        #define sz(q) (int)(q.size())
        
        using namespace std;
        typedef long long int ll;
        typedef long int li;

        void solution() {{
            {}
        }}
        
        int main() {{
            fastio
            int t;
            cin >> t;
            while(t--) solution();
        }}
        ]],
        { i(0) }
      )),
    })
  end,
}
