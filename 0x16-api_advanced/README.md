<h1>0x16-api_advanced</h1>

<h1>RESOURCES</h1>
<li><a href="https://intranet.alxswe.com/rltoken/b-4nD6hwEeNYTwYl5yWNwA">Reddit Api</a></li>
<li><a href="https://intranet.alxswe.com/rltoken/luFn_zrgmAQ0OAO_PEI9bA">Quary String</a></li>

<h2>Tasks</h2>

<h3>0. How many subs?</h3>
<p>
Write a function that queries the Reddit API and returns the number of subscribers (not active users, total subscribers) for a given subreddit. If an invalid subreddit is given, the function should return 0.<br>

Hint: No authentication is necessary for most features of the Reddit API. If you’re getting errors related to Too Many Requests, ensure you’re setting a custom User-Agent.
</p>
<br>

<b>Requirements:</b>

<li>Prototype: def number_of_subscribers(subreddit)
<li>If not a valid subreddit, return 0.
<li>NOTE: Invalid subreddits may return a redirect to search results. Ensure that you are not following redirects.
<br>
<pre>
wintermancer@lapbox ~/reddit_api/project $ cat 0-main.py
#!/usr/bin/python3
"""
0-main
"""
import sys

if __name__ == '__main__':
    number_of_subscribers = __import__('0-subs').number_of_subscribers
    if len(sys.argv) < 2:
        print("Please pass an argument for the subreddit to search.")
    else:
        print("{:d}".format(number_of_subscribers(sys.argv[1])))
wintermancer@lapbox ~/reddit_api/project $ python3 0-main.py programming
756024
wintermancer@lapbox ~/reddit_api/project $ python3 0-main.py this_is_a_fake_subreddit
0
</pre>
<br>
  
<h3>1. Top Ten</h3>
<p>
Write a function that queries the Reddit API and prints the titles of the first 10 hot posts listed for a given subreddit.
</p>
<br>
<b>Requirements:</b>

<li>Prototype: def top_ten(subreddit)</li>
<li>If not a valid subreddit, print None.</li>
<li>NOTE: Invalid subreddits may return a redirect to search results. Ensure that you are not following redirects.</li>
<br>
<pre>
wintermancer@lapbox ~/reddit_api/project $ cat 1-main.py
#!/usr/bin/python3
"""
1-main
"""
import sys

if __name__ == '__main__':
    top_ten = __import__('1-top_ten').top_ten
    if len(sys.argv) < 2:
        print("Please pass an argument for the subreddit to search.")
    else:
        top_ten(sys.argv[1])
wintermancer@lapbox ~/reddit_api/project $ python3 1-main.py programming
Firebase founder's response to last week's "Firebase Costs increased by 7000%!"
How a 64k intro is made
HTTPS on Stack Overflow: The End of a Long Road
Spend effort on your Git commits
It's a few years old, but I just discovered this incredibly impressive video of researchers reconstructing sounds from video information alone
From the D Blog: Introspection, Introspection Everywhere
Do MVC like it’s 1979
GitHub is moving to GraphQL for v4 of their API (v3 was a REST API)
Google Bug Bounty - The 5k Error Page
PyCon 2017 Talk Videos
wintermancer@lapbox ~/reddit_api/project $ python3 1-main.py this_is_a_fake_subreddit
None
wintermancer@lapbox ~/reddit_api/project $ 
</pre>
<br>
<h3>2. Recurse it!</h3>
<p>
Write a recursive function that queries the Reddit API and returns a list containing the titles of all hot articles for a given subreddit. If no results are found for the given subreddit, the function should return None.<br>

Hint: The Reddit API uses pagination for separating pages of responses.
</p>
<b>Requirements:</b>

<li>Prototype: def recurse(subreddit, hot_list=[])</li>
<li>Note: You may change the prototype, but it must be able to be called with just a subreddit supplied. AKA you can add a counter, but it must work without supplying a starting value in the main.</li>
<li>If not a valid subreddit, return None.</li>
<li>NOTE: Invalid subreddits may return a redirect to search results. Ensure that you are not following redirects.</li>
<br>
Your code will NOT pass if you are using a loop and not recursively calling the function! This /can/ be done with a loop but the point is to use a recursive function. :)
<br>
<pre>
wintermancer@lapbox ~/reddit_api/project $ cat 2-main.py
#!/usr/bin/python3
"""
2-main
"""
import sys

if __name__ == '__main__':
    recurse = __import__('2-recurse').recurse
    if len(sys.argv) < 2:
        print("Please pass an argument for the subreddit to search.")
    else:
        result = recurse(sys.argv[1])
        if result is not None:
            print(len(result))
        else:
            print("None")
wintermancer@lapbox ~/reddit_api/project $ python3 2-main.py programming
932
wintermancer@lapbox ~/reddit_api/project $ python3 2-main.py this_is_a_fake_subreddit
None
</pre>
<br>
  
<h3>3. Count it!</h3>
<p>
Write a recursive function that queries the Reddit API, parses the title of all hot articles, and prints a sorted count of given keywords (case-insensitive, delimited by spaces. Javascript should count as javascript, but java should not).
</p>
<br>
<b>Requirements:</b>

<li>Prototype: def count_words(subreddit, word_list)</li>
<li>Note: You may change the prototype, but it must be able to be called with just a subreddit supplied and a list of keywords. AKA you can add a counter or anything else, but the function must work without supplying a starting value in the main.</li>
<li>If word_list contains the same word (case-insensitive), the final count should be the sum of each duplicate (example below with java)</li>
<li>Results should be printed in descending order, by the count, and if the count is the same for separate keywords, they should then be sorted alphabetically (ascending, from A to Z). Words with no matches should be skipped and not printed. Words must be printed in lowercase.</li>
<li>Results are based on the number of times a keyword appears, not titles it appears in. java java java counts as 3 separate occurrences of java.</li>
<li>To make life easier, java. or java! or java_ should not count as java</li>
<li>If no posts match or the subreddit is invalid, print nothing.</li>
<li>NOTE: Invalid subreddits may return a redirect to search results. Ensure that you are NOT following redirects.</li>
<br>
Your code will NOT pass if you are using a loop and not recursively calling the function! This /can/ be done with a loop but the point is to use a recursive function. :)
<br>
<p>
Disclaimer: number presented in this example cannot be accurate now - Reddit is hot articles are always changing.
</p>
<br>
<pre>
bob@dylan $ cat 100-main.py 
#!/usr/bin/python3
"""
100-main
"""
import sys

if __name__ == '__main__':
    count_words = __import__('100-count').count_words
    if len(sys.argv) < 3:
        print("Usage: {} <subreddit> <list of keywords>".format(sys.argv[0]))
        print("Ex: {} programming 'python java javascript'".format(sys.argv[0]))
    else:
        result = count_words(sys.argv[1], [x for x in sys.argv[2].split()])
bob@dylan $             
bob@dylan $ python3 100-main.py programming 'react python java javascript scala no_results_for_this_one'
java: 27
javascript: 20
python: 17
react: 17
scala: 4
bob@dylan $ python3 100-main.py programming 'JavA java'
java: 54
bob@dylan $ python3 100-main.py not_a_valid_subreddit 'python java javascript scala no_results_for_this_one'
bob@dylan $ python3 100-main.py not_a_valid_subreddit 'python java'
bob@dylan $ 
</pre>
