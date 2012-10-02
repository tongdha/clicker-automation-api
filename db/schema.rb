# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120927192537) do

  create_table "__c3p0_test", :id => false, :force => true do |t|
    t.string "a", :limit => 1
  end

  create_table "archive_video_metadata", :primary_key => "videoMetadataId", :force => true do |t|
    t.string   "airDate",              :limit => 50
    t.text     "description"
    t.text     "episodeDescription"
    t.string   "episodeNumber",        :limit => 50
    t.text     "episodeSynopsis"
    t.text     "episodeTags"
    t.string   "episodeTitle"
    t.string   "genre"
    t.string   "imageUrl",             :limit => 512
    t.boolean  "mapped",                              :default => false
    t.string   "network",              :limit => 50
    t.text     "other"
    t.string   "parentUrl",            :limit => 512
    t.integer  "runHours",             :limit => 2
    t.integer  "runMinutes",           :limit => 2
    t.integer  "runSeconds",           :limit => 2
    t.string   "runTime",              :limit => 20
    t.string   "seasonNumber",         :limit => 25
    t.text     "tags"
    t.string   "title"
    t.string   "titleUrl",             :limit => 512
    t.string   "url",                  :limit => 512
    t.integer  "crawledPageId",        :limit => 8
    t.integer  "distributorProfileId", :limit => 8
    t.integer  "crawlerConfigId",      :limit => 8
    t.string   "episodeGenre"
    t.text     "secondaryUrls"
    t.string   "seasonName",           :limit => 100
    t.string   "endDate"
    t.string   "startDate"
    t.string   "clipTitle"
    t.string   "clipType"
    t.string   "clipNumber",           :limit => 25
    t.string   "rssFeedUrl",           :limit => 512
    t.datetime "dateCreated"
    t.text     "fingerPrint"
    t.string   "pageTitle"
    t.boolean  "deactivated",                         :default => false
    t.text     "awards"
    t.string   "officialRating",       :limit => 25
    t.text     "persons"
    t.integer  "releaseYear"
    t.text     "similars"
    t.string   "sourceCategories",     :limit => 500
    t.string   "sourceId",             :limit => 100
    t.string   "studio",               :limit => 50
    t.float    "price"
    t.datetime "dateDeactivated"
    t.integer  "changeUserId"
    t.datetime "datePublished"
    t.boolean  "isClip",                              :default => false
  end

  add_index "archive_video_metadata", ["crawlerConfigId"], :name => "crawlerConfigId"
  add_index "archive_video_metadata", ["distributorProfileId"], :name => "distributorProfileId"
  add_index "archive_video_metadata", ["mapped", "distributorProfileId"], :name => "idx_mapped_distri"
  add_index "archive_video_metadata", ["sourceId"], :name => "sourceId"

  create_table "audits", :force => true do |t|
    t.integer  "auditable_id"
    t.string   "auditable_type"
    t.integer  "user_id"
    t.string   "user_type"
    t.string   "username"
    t.string   "action"
    t.text     "differences"
    t.integer  "version",        :default => 0
    t.string   "comment"
    t.datetime "created_at"
  end

  add_index "audits", ["auditable_id", "auditable_type"], :name => "auditable_index"
  add_index "audits", ["created_at"], :name => "index_audits_on_created_at"
  add_index "audits", ["user_id", "user_type"], :name => "user_index"

  create_table "c3p0_test", :id => false, :force => true do |t|
    t.string "a", :limit => 1
  end

  create_table "crawl_history", :primary_key => "crawlHistoryId", :force => true do |t|
    t.datetime "endTime"
    t.datetime "startTime",                         :null => false
    t.integer  "totalLinksAttempted"
    t.integer  "totalLinksFailed"
    t.integer  "totalLinksSucceed"
    t.integer  "totalSizeInBytes",    :limit => 8
    t.integer  "totalTimeInSecs",     :limit => 8
    t.integer  "crawlerConfigId",     :limit => 8,  :null => false
    t.string   "ip",                  :limit => 20
    t.string   "pid",                 :limit => 20
  end

  add_index "crawl_history", ["crawlerConfigId"], :name => "crawlerConfigId"

  create_table "crawl_history__video_metadata", :id => false, :force => true do |t|
    t.string  "status",          :limit => 25
    t.integer "crawlHistoryId",  :limit => 8,  :default => 0, :null => false
    t.integer "videoMetadataId", :limit => 8,  :default => 0, :null => false
  end

  add_index "crawl_history__video_metadata", ["crawlHistoryId"], :name => "FK6C6896CFF1FE604A"
  add_index "crawl_history__video_metadata", ["videoMetadataId"], :name => "FK6C6896CFD4B1E93A"

  create_table "crawled_page", :primary_key => "crawledPageId", :force => true do |t|
    t.text    "content",         :limit => 2147483647, :null => false
    t.string  "contentEncoding"
    t.integer "contentLength"
    t.string  "contentType",                           :null => false
    t.integer "expiration",      :limit => 8
    t.integer "lastModified",    :limit => 8,          :null => false
    t.string  "location"
    t.integer "responseCode",                          :null => false
    t.string  "responseMessage"
    t.string  "url",                                   :null => false
  end

  create_table "crawler_config", :primary_key => "crawlerConfigId", :force => true do |t|
    t.string  "crawlingEnabled",              :limit => 10,                      :null => false
    t.string  "description",                  :limit => 100
    t.boolean "isClip",                                       :default => false
    t.integer "distributorProfileId",         :limit => 8,                       :null => false
    t.integer "distributorProfileId2",        :limit => 8
    t.integer "maxDepth",                                                        :null => false
    t.integer "maxThreads"
    t.string  "scrapingConfigFiles",          :limit => 1024
    t.integer "sleepTimeInSecs"
    t.string  "startURL",                     :limit => 5000,                    :null => false
    t.string  "videoLinkRegExpPattern"
    t.string  "rssFeedRegExpPattern"
    t.boolean "autoImport",                                   :default => false
    t.boolean "autoMap",                                      :default => false
    t.string  "intervalInHours",              :limit => 10
    t.time    "startTime"
    t.boolean "clickToPlay",                                  :default => false
    t.boolean "hasImageUrl",                                  :default => false
    t.boolean "manualGrabOnly",                               :default => false
    t.integer "specClickId"
    t.integer "specGrabId"
    t.integer "specStreamId"
    t.string  "postProcessors",               :limit => 512
    t.integer "tier",                         :limit => 2
    t.string  "allowedFilters",               :limit => 1000
    t.string  "disallowedFilters",            :limit => 1000
    t.string  "distributorProfileIdsToMatch", :limit => 1000
    t.string  "categoryIds",                  :limit => 128
    t.integer "priority",                     :limit => 2
    t.integer "mediaTypeId",                                                     :null => false
    t.integer "showLinkTypeId",                               :default => 1
    t.string  "mediaTypeIdsToMatch",          :limit => 20
    t.boolean "makeImageMoviePoster",                         :default => false
    t.boolean "useSourceId",                                  :default => false, :null => false
    t.boolean "reviewUncertain0",                             :default => false
    t.boolean "tempStatus",                                   :default => false
  end

  add_index "crawler_config", ["distributorProfileId"], :name => "distributorProfileId"

  create_table "dusers", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                            :null => false
    t.datetime "updated_at",                                            :null => false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
  end

  add_index "dusers", ["email"], :name => "index_dusers_on_email", :unique => true
  add_index "dusers", ["reset_password_token"], :name => "index_dusers_on_reset_password_token", :unique => true

  create_table "episodes", :primary_key => "episodeId", :force => true do |t|
    t.datetime "airDate"
    t.string   "comments",                :limit => 100
    t.datetime "dateCreated"
    t.datetime "dateReviewed"
    t.datetime "dateUploaded"
    t.text     "description"
    t.integer  "distributorProfileId",    :limit => 8,                      :null => false
    t.string   "espisodeNumber",          :limit => 50
    t.string   "imageUrl",                :limit => 512
    t.integer  "matchConfidentLevel"
    t.boolean  "reviewed",                               :default => false
    t.string   "runTime",                 :limit => 20
    t.string   "seasonNumber",            :limit => 25
    t.text     "synopsis"
    t.text     "tags"
    t.string   "title",                                                     :null => false
    t.text     "uploaderrormessage"
    t.integer  "showId",                  :limit => 8
    t.integer  "videoMetadataId",         :limit => 8
    t.string   "seasonName",              :limit => 100
    t.datetime "endDate"
    t.datetime "startDate"
    t.integer  "runHours",                :limit => 2
    t.integer  "runMinutes",              :limit => 2
    t.integer  "runSeconds",              :limit => 2
    t.integer  "crawlerConfigId",         :limit => 8
    t.integer  "targetEpisodeId",         :limit => 8
    t.integer  "targetEpisodeMetadataId", :limit => 8
    t.integer  "displayOrder"
    t.string   "availabiityNotes",        :limit => 500
    t.integer  "changeUserId"
    t.datetime "dateChanged"
    t.text     "persons"
  end

  add_index "episodes", ["crawlerConfigId"], :name => "idx_crawlerConfigId"
  add_index "episodes", ["showId"], :name => "idx_showId"
  add_index "episodes", ["targetEpisodeId"], :name => "idx_targetEpisodeId"
  add_index "episodes", ["videoMetadataId"], :name => "idx_videometadataid"

  create_table "feeds", :primary_key => "feedId", :force => true do |t|
    t.string   "comments",             :limit => 100
    t.datetime "dateCreated"
    t.datetime "dateReviewed"
    t.datetime "dateUploaded"
    t.integer  "distributorProfileId", :limit => 8,                       :null => false
    t.integer  "matchConfidentLevel"
    t.boolean  "reviewed",                             :default => false
    t.integer  "runHours",             :limit => 2
    t.integer  "runMinutes",           :limit => 2
    t.integer  "runSeconds",           :limit => 2
    t.string   "runTime",              :limit => 20
    t.text     "uploaderrormessage"
    t.string   "url",                  :limit => 5000
    t.integer  "episodeId",            :limit => 8
    t.integer  "videoMetadataId",      :limit => 8
    t.string   "type",                 :limit => 50
    t.integer  "crawlerConfigId",      :limit => 8
    t.integer  "targetFeedId",         :limit => 8
    t.datetime "dateLastVerified"
    t.string   "verificationStatus"
    t.text     "description"
    t.string   "name"
    t.boolean  "deleteOnTarget",                       :default => false
    t.datetime "endDate"
    t.string   "sourceId",             :limit => 100
    t.datetime "startDate"
    t.float    "price"
    t.integer  "changeUserId"
    t.datetime "dateChanged"
  end

  add_index "feeds", ["crawlerConfigId"], :name => "crawlerConfigId"
  add_index "feeds", ["dateCreated"], :name => "index_feeds_on_dateCreated"
  add_index "feeds", ["distributorProfileId"], :name => "distributorProfileId"
  add_index "feeds", ["episodeId", "feedId"], :name => "idx_feed_episode"
  add_index "feeds", ["episodeId"], :name => "episodeId"
  add_index "feeds", ["targetFeedId"], :name => "targetFeedId"
  add_index "feeds", ["videoMetadataId"], :name => "videoMetadataId"

  create_table "link_verifier_config", :primary_key => "linkVerifierConfigId", :force => true do |t|
    t.boolean "checkExpirationDate",                         :default => false
    t.boolean "httpPing",                                    :default => false
    t.boolean "checkFingerPrint",                            :default => false
    t.integer "crawlerConfigId",             :limit => 8
    t.string  "description",                 :limit => 100
    t.integer "distributorProfileId",        :limit => 8,                       :null => false
    t.boolean "enabled",                                     :default => false
    t.string  "intervalInHours",             :limit => 10
    t.time    "startTime"
    t.string  "unpublishOption",             :limit => 15
    t.string  "verificationType",            :limit => 10
    t.string  "showIds",                     :limit => 5000
    t.boolean "verifyUnexpiredLinks",                        :default => false
    t.string  "confirmedVerificationStatus"
    t.integer "sleepTimeInMilliSecs"
    t.boolean "manualSource",                                :default => false
    t.string  "linkVerifier",                :limit => 50
    t.string  "sitemapUrl",                  :limit => 3000
    t.string  "sitemapUrlXpath",             :limit => 256
    t.integer "sitemapSafeguardMinUrls"
    t.boolean "sitemapReversed",                             :default => false
  end

  add_index "link_verifier_config", ["crawlerConfigId"], :name => "crawlerConfigId"
  add_index "link_verifier_config", ["distributorProfileId"], :name => "distributorProfileId"

  create_table "link_verify_history", :primary_key => "linkVerifyHistoryId", :force => true do |t|
    t.datetime "endTime"
    t.datetime "startTime",                           :null => false
    t.integer  "totalLinksAttempted"
    t.integer  "totalLinksDown"
    t.integer  "totalLinksExpired"
    t.integer  "totalLinksUnchanged"
    t.integer  "totalTimeInSecs",       :limit => 8
    t.integer  "linkVerifierConfigId",  :limit => 8,  :null => false
    t.integer  "totalLinksDeactivated"
    t.string   "ip",                    :limit => 20
    t.string   "pid",                   :limit => 20
  end

  add_index "link_verify_history", ["linkVerifierConfigId"], :name => "FK8F5915B3A05592B4"

  create_table "machine", :primary_key => "machineId", :force => true do |t|
    t.string  "cpuDescription"
    t.string  "description"
    t.string  "ipAddress",                      :null => false
    t.binary  "isVirtual",         :limit => 1, :null => false
    t.string  "memoryDescription"
    t.string  "name",                           :null => false
    t.string  "os",                             :null => false
    t.integer "serverFarmId",      :limit => 8, :null => false
  end

  add_index "machine", ["ipAddress"], :name => "ipAddress", :unique => true
  add_index "machine", ["name"], :name => "name", :unique => true
  add_index "machine", ["serverFarmId"], :name => "FK31314447776599A2"

  create_table "server_farm", :primary_key => "serverFarmId", :force => true do |t|
    t.string "description"
    t.string "name",        :null => false
  end

  create_table "shows", :primary_key => "showId", :force => true do |t|
    t.string   "comments",                :limit => 100
    t.datetime "dateCreated"
    t.datetime "dateReviewed"
    t.datetime "dateUploaded"
    t.text     "description"
    t.integer  "distributorProfileId",    :limit => 8,                      :null => false
    t.string   "genre"
    t.integer  "matchConfidentLevel"
    t.string   "network",                 :limit => 50
    t.boolean  "reviewed",                               :default => false
    t.text     "tags"
    t.string   "title",                                                     :null => false
    t.text     "uploaderrormessage"
    t.string   "url",                     :limit => 512
    t.integer  "videoMetadataId",         :limit => 8,                      :null => false
    t.integer  "crawlerConfigId",         :limit => 8
    t.boolean  "clickToPlay",                            :default => false
    t.boolean  "hasImageUrl",                            :default => false
    t.boolean  "manualGrabOnly",                         :default => false
    t.integer  "specClickId"
    t.integer  "specGrabId"
    t.integer  "specStreamId"
    t.integer  "targetShowId",            :limit => 8
    t.integer  "targetShowMetadataId",    :limit => 8
    t.string   "manuallyGeneratedTextId"
    t.string   "categoryIds",             :limit => 128
    t.text     "awards"
    t.string   "officialRating",          :limit => 25
    t.text     "persons"
    t.integer  "releaseYear"
    t.text     "similars"
    t.string   "sourceCategories",        :limit => 500
    t.string   "studio",                  :limit => 50
    t.integer  "mediaTypeId"
    t.string   "availabiityNotes",        :limit => 500
    t.integer  "linkTypeId"
    t.integer  "changeUserId"
    t.datetime "dateChanged"
  end

  add_index "shows", ["crawlerConfigId"], :name => "crawlerconfigid"
  add_index "shows", ["mediaTypeId"], :name => "media_type_index"
  add_index "shows", ["targetShowId"], :name => "targetShowId"

  create_table "test", :id => false, :force => true do |t|
    t.datetime "created"
  end

  create_table "users", :force => true do |t|
    t.string   "login",                                  :null => false
    t.string   "email",                                  :null => false
    t.string   "crypted_password",                       :null => false
    t.string   "password_salt",                          :null => false
    t.string   "persistence_token",                      :null => false
    t.string   "single_access_token",                    :null => false
    t.string   "perishable_token",                       :null => false
    t.integer  "login_count",          :default => 0,    :null => false
    t.integer  "failed_login_count",   :default => 0,    :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
    t.boolean  "active",               :default => true
    t.integer  "watchable_user_id"
    t.text     "roles"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
  end

  create_table "video_metadata", :primary_key => "videoMetadataId", :force => true do |t|
    t.string   "airDate",              :limit => 50
    t.text     "description"
    t.text     "episodeDescription"
    t.string   "episodeNumber",        :limit => 50
    t.text     "episodeSynopsis"
    t.text     "episodeTags"
    t.string   "episodeTitle"
    t.string   "genre"
    t.string   "imageUrl",             :limit => 512
    t.boolean  "mapped",                              :default => false
    t.string   "network",              :limit => 50
    t.text     "other"
    t.string   "parentUrl",            :limit => 512
    t.integer  "runHours",             :limit => 2
    t.integer  "runMinutes",           :limit => 2
    t.integer  "runSeconds",           :limit => 2
    t.string   "runTime",              :limit => 20
    t.string   "seasonNumber",         :limit => 25
    t.text     "tags"
    t.string   "title"
    t.string   "titleUrl",             :limit => 512
    t.string   "url",                  :limit => 512
    t.integer  "crawledPageId",        :limit => 8
    t.integer  "distributorProfileId", :limit => 8
    t.integer  "crawlerConfigId",      :limit => 8
    t.string   "episodeGenre"
    t.text     "secondaryUrls"
    t.string   "seasonName",           :limit => 100
    t.string   "endDate"
    t.string   "startDate"
    t.string   "clipTitle"
    t.string   "clipType"
    t.string   "clipNumber",           :limit => 25
    t.string   "rssFeedUrl",           :limit => 512
    t.datetime "dateCreated"
    t.text     "fingerPrint"
    t.string   "pageTitle"
    t.boolean  "deactivated",                         :default => false
    t.text     "awards"
    t.string   "officialRating",       :limit => 25
    t.text     "persons"
    t.integer  "releaseYear"
    t.text     "similars"
    t.string   "sourceCategories",     :limit => 500
    t.string   "sourceId",             :limit => 100
    t.string   "studio",               :limit => 50
    t.float    "price"
    t.datetime "dateDeactivated"
    t.integer  "changeUserId"
    t.datetime "datePublished"
    t.boolean  "isClip",                              :default => false
  end

  add_index "video_metadata", ["crawledPageId"], :name => "FK860272737F069510"
  add_index "video_metadata", ["crawlerConfigId"], :name => "crawlerConfigId"
  add_index "video_metadata", ["distributorProfileId"], :name => "distributorProfileId"
  add_index "video_metadata", ["mapped", "distributorProfileId"], :name => "idx_mapped_distri"
  add_index "video_metadata", ["sourceId"], :name => "sourceId"

  create_table "webapp_live_event_config", :primary_key => "webAppLiveEventConfigId", :force => true do |t|
    t.integer "networkId",                   :null => false
    t.integer "showId",                      :null => false
    t.string  "sourceId",    :limit => 225,  :null => false
    t.string  "description", :limit => 100
    t.string  "feedUrl",     :limit => 4096
    t.string  "overrideUrl", :limit => 4096
  end

  add_index "webapp_live_event_config", ["networkId", "sourceId"], :name => "networkid_sourceid", :unique => true

end
