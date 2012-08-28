object @crawl_histories
 
# Reuse the show template definition
extends "api/v1/crawl_histories/show"
 
# Let's add an "id" resource for the index action
attributes :crawlHistoryId