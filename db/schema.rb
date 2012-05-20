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

ActiveRecord::Schema.define(:version => 20120520214408) do

  create_table "artikel", :force => true do |t|
    t.string  "Bezeichnung"
    t.decimal "Preis",                          :precision => 10, :scale => 2, :default => 0.0, :null => false
    t.integer "Kategorie_id",                                                                   :null => false
    t.text    "Beschreibung"
    t.string  "Image_url",      :limit => 2000
    t.integer "Anzahl",                                                        :default => 0,   :null => false
    t.integer "ist_archiviert",                                                :default => 0
  end

  add_index "artikel", ["Kategorie_id"], :name => "FK_item_category"

  create_table "benutzer", :force => true do |t|
    t.string "Vorname"
    t.string "Nachname"
    t.string "Straße"
    t.string "Hausnummer"
    t.string "Postleitzahl"
    t.string "Ort"
    t.string "email"
    t.string "Telefonnummer"
    t.string "Benutzername"
    t.binary "Passwort"
  end

  create_table "bestelldetails", :force => true do |t|
    t.integer "Artikel_id",                                                  :null => false
    t.integer "Bestellung_id",                                               :null => false
    t.integer "Anzahl",                                       :default => 1, :null => false
    t.decimal "Kaufpreis",     :precision => 10, :scale => 2
  end

  add_index "bestelldetails", ["Artikel_id"], :name => "FK_orderdetails_item"
  add_index "bestelldetails", ["Bestellung_id"], :name => "FK_orderdetails_order"

  create_table "bestellstatus", :force => true do |t|
    t.string "Status", :null => false
  end

  create_table "bestellung", :force => true do |t|
    t.datetime "Bestelldatum"
    t.integer  "Benutzer_id"
    t.integer  "Status_id"
    t.decimal  "MwSt",          :precision => 10, :scale => 2
    t.decimal  "Versandkosten", :precision => 10, :scale => 2
  end

  add_index "bestellung", ["Benutzer_id"], :name => "FK_order_customer"
  add_index "bestellung", ["Status_id"], :name => "FK_order_status"

  create_table "events", :force => true do |t|
    t.string   "title"
    t.datetime "time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "homepages", :force => true do |t|
    t.string   "url"
    t.string   "name"
    t.string   "beschreibung"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "kategorie", :force => true do |t|
    t.string "Bezeichnung", :null => false
  end

  create_table "my_aspnet_applications", :force => true do |t|
    t.string "name",        :limit => 256
    t.string "description", :limit => 256
  end

  create_table "my_aspnet_membership", :primary_key => "userId", :force => true do |t|
    t.string   "Email",                                  :limit => 128
    t.string   "Comment"
    t.string   "Password",                               :limit => 128, :null => false
    t.string   "PasswordKey",                            :limit => 32
    t.integer  "PasswordFormat",                         :limit => 1
    t.string   "PasswordQuestion"
    t.string   "PasswordAnswer"
    t.boolean  "IsApproved"
    t.datetime "LastActivityDate"
    t.datetime "LastLoginDate"
    t.datetime "LastPasswordChangedDate"
    t.datetime "CreationDate"
    t.boolean  "IsLockedOut"
    t.datetime "LastLockedOutDate"
    t.integer  "FailedPasswordAttemptCount"
    t.datetime "FailedPasswordAttemptWindowStart"
    t.integer  "FailedPasswordAnswerAttemptCount"
    t.datetime "FailedPasswordAnswerAttemptWindowStart"
  end

  create_table "my_aspnet_profiles", :primary_key => "userId", :force => true do |t|
    t.text      "valueindex",      :limit => 2147483647
    t.text      "stringdata",      :limit => 2147483647
    t.binary    "binarydata",      :limit => 2147483647
    t.timestamp "lastUpdatedDate",                       :null => false
  end

  create_table "my_aspnet_roles", :force => true do |t|
    t.integer "applicationId", :null => false
    t.string  "name",          :null => false
  end

  create_table "my_aspnet_schemaversion", :id => false, :force => true do |t|
    t.integer "version"
  end

  create_table "my_aspnet_sessioncleanup", :id => false, :force => true do |t|
    t.datetime "LastRun",         :null => false
    t.integer  "IntervalMinutes", :null => false
  end

  create_table "my_aspnet_sessions", :id => false, :force => true do |t|
    t.string   "SessionId",                           :null => false
    t.integer  "ApplicationId",                       :null => false
    t.datetime "Created",                             :null => false
    t.datetime "Expires",                             :null => false
    t.datetime "LockDate",                            :null => false
    t.integer  "LockId",                              :null => false
    t.integer  "Timeout",                             :null => false
    t.boolean  "Locked",                              :null => false
    t.binary   "SessionItems",  :limit => 2147483647
    t.integer  "Flags",                               :null => false
  end

  create_table "my_aspnet_users", :force => true do |t|
    t.integer  "applicationId",                                     :null => false
    t.string   "name",             :limit => 256,                   :null => false
    t.boolean  "isAnonymous",                     :default => true, :null => false
    t.datetime "lastActivityDate"
  end

  create_table "my_aspnet_usersinroles", :id => false, :force => true do |t|
    t.integer "userId", :default => 0, :null => false
    t.integer "roleId", :default => 0, :null => false
  end

  create_table "stammdaten", :force => true do |t|
    t.string  "Firmenname"
    t.string  "Bezeichnung"
    t.string  "Straße"
    t.string  "Hausnummer"
    t.string  "Postleitzahl"
    t.decimal "MwSt",                   :precision => 10, :scale => 2
    t.decimal "Versandkostenpauschale", :precision => 10, :scale => 2
  end

  create_table "usagerecords", :force => true do |t|
    t.string   "browser"
    t.string   "language"
    t.datetime "timestamp"
    t.integer  "fk_idHomepage"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "homepage_id"
    t.string   "homepage"
    t.string   "resolution"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "warenkorb", :force => true do |t|
    t.integer  "Artikel_id"
    t.string   "Session_ID"
    t.integer  "Anzahl",      :default => 1, :null => false
    t.datetime "Zeitstempel"
  end

  add_index "warenkorb", ["Artikel_id"], :name => "FK_cart_item"

end
