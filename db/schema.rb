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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180110180055) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "account_versions", id: :serial, force: :cascade do |t|
    t.integer "member_id"
    t.integer "account_id"
    t.integer "reason"
    t.decimal "balance", precision: 32, scale: 16
    t.decimal "locked", precision: 32, scale: 16
    t.decimal "amount", precision: 32, scale: 16
    t.string "modifiable_type"
    t.integer "modifiable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "currency"
    t.decimal "fee", precision: 32, scale: 16
    t.integer "fun"
    t.index ["account_id", "reason"], name: "index_account_versions_on_account_id_and_reason"
    t.index ["account_id"], name: "index_account_versions_on_account_id"
    t.index ["member_id", "reason"], name: "index_account_versions_on_member_id_and_reason"
    t.index ["modifiable_id", "modifiable_type"], name: "index_account_versions_on_modifiable_id_and_modifiable_type"
  end

  create_table "accounts", id: :serial, force: :cascade do |t|
    t.integer "member_id"
    t.integer "currency"
    t.decimal "balance", precision: 32, scale: 16
    t.decimal "locked", precision: 32, scale: 16
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal "in", precision: 32, scale: 16
    t.decimal "out", precision: 32, scale: 16
    t.integer "default_withdraw_fund_source_id"
    t.index ["member_id", "currency"], name: "index_accounts_on_member_id_and_currency"
    t.index ["member_id"], name: "index_accounts_on_member_id"
  end

  create_table "api_tokens", id: :serial, force: :cascade do |t|
    t.integer "member_id", null: false
    t.string "access_key", limit: 50, null: false
    t.string "secret_key", limit: 50, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "trusted_ip_list"
    t.string "label"
    t.integer "oauth_access_token_id"
    t.datetime "expire_at"
    t.string "scopes"
    t.datetime "deleted_at"
    t.index ["access_key"], name: "index_api_tokens_on_access_key", unique: true
    t.index ["secret_key"], name: "index_api_tokens_on_secret_key", unique: true
  end

  create_table "assets", id: :serial, force: :cascade do |t|
    t.string "type"
    t.integer "attachable_id"
    t.string "attachable_type"
    t.string "file"
  end

  create_table "audit_logs", id: :serial, force: :cascade do |t|
    t.string "type"
    t.integer "operator_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "auditable_id"
    t.string "auditable_type"
    t.string "source_state"
    t.string "target_state"
    t.index ["auditable_id", "auditable_type"], name: "index_audit_logs_on_auditable_id_and_auditable_type"
    t.index ["operator_id"], name: "index_audit_logs_on_operator_id"
  end

  create_table "authentications", id: :serial, force: :cascade do |t|
    t.string "provider"
    t.string "uid"
    t.string "token"
    t.string "secret"
    t.integer "member_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "nickname"
    t.index ["member_id"], name: "index_authentications_on_member_id"
    t.index ["provider", "uid"], name: "index_authentications_on_provider_and_uid"
  end

  create_table "comments", id: :serial, force: :cascade do |t|
    t.text "content"
    t.integer "author_id"
    t.integer "ticket_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "currencies", force: :cascade do |t|
    t.string "name", null: false
    t.string "code", null: false
    t.string "symbol", default: "฿", null: false
    t.boolean "is_tradable", default: false
    t.boolean "fiat", default: false
    t.jsonb "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_currencies_on_code", unique: true
  end

  create_table "deposits", id: :serial, force: :cascade do |t|
    t.integer "account_id"
    t.decimal "amount", precision: 32, scale: 16
    t.string "txid"
    t.integer "state"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "member_id"
    t.integer "currency"
    t.datetime "done_at"
    t.string "fund_uid"
    t.string "fund_extra"
    t.decimal "fee", precision: 32, scale: 16
    t.string "aasm_state"
    t.string "confirmations"
    t.string "type"
    t.integer "payment_transaction_id"
    t.integer "txout"
    t.index ["txid", "txout"], name: "index_deposits_on_txid_and_txout"
  end

  create_table "documents", id: :serial, force: :cascade do |t|
    t.string "key"
    t.string "title"
    t.text "body"
    t.boolean "is_auth"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "desc"
    t.text "keywords"
  end

  create_table "fund_sources", id: :serial, force: :cascade do |t|
    t.string "extra"
    t.string "uid"
    t.boolean "is_locked", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer "member_id"
    t.integer "currency"
  end

  create_table "id_documents", id: :serial, force: :cascade do |t|
    t.integer "id_document_type"
    t.string "name"
    t.string "id_document_number"
    t.integer "member_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date "birth_date"
    t.text "address"
    t.string "city"
    t.string "country"
    t.string "zipcode"
    t.integer "id_bill_type"
    t.string "aasm_state"
  end

  create_table "identities", id: :serial, force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.boolean "is_active"
    t.integer "retry_count"
    t.boolean "is_locked"
    t.datetime "locked_at"
    t.datetime "last_verify_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "members", id: :serial, force: :cascade do |t|
    t.string "sn", null: false
    t.string "email"
    t.integer "identity_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "state"
    t.boolean "activated"
    t.integer "country_code"
    t.string "phone_number"
    t.string "display_name"
    t.boolean "disabled", default: false
    t.boolean "api_disabled", default: false
    t.string "nickname"
    t.index ["display_name"], name: "index_members_on_display_name", unique: true
    t.index ["email"], name: "index_members_on_email", unique: true
  end

  create_table "oauth_access_grants", id: :serial, force: :cascade do |t|
    t.integer "resource_owner_id", null: false
    t.integer "application_id", null: false
    t.string "token", null: false
    t.integer "expires_in", null: false
    t.text "redirect_uri", null: false
    t.datetime "created_at", null: false
    t.datetime "revoked_at"
    t.string "scopes"
    t.index ["token"], name: "index_oauth_access_grants_on_token", unique: true
  end

  create_table "oauth_access_tokens", id: :serial, force: :cascade do |t|
    t.integer "resource_owner_id"
    t.integer "application_id"
    t.string "token", null: false
    t.string "refresh_token"
    t.integer "expires_in"
    t.datetime "revoked_at"
    t.datetime "created_at", null: false
    t.string "scopes"
    t.datetime "deleted_at"
    t.index ["refresh_token"], name: "index_oauth_access_tokens_on_refresh_token", unique: true
    t.index ["resource_owner_id"], name: "index_oauth_access_tokens_on_resource_owner_id"
    t.index ["token"], name: "index_oauth_access_tokens_on_token", unique: true
  end

  create_table "oauth_applications", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.string "uid", null: false
    t.string "secret", null: false
    t.text "redirect_uri", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["uid"], name: "index_oauth_applications_on_uid", unique: true
  end

  create_table "orders", id: :serial, force: :cascade do |t|
    t.integer "bid"
    t.integer "ask"
    t.integer "currency"
    t.decimal "price", precision: 32, scale: 16
    t.decimal "volume", precision: 32, scale: 16
    t.decimal "origin_volume", precision: 32, scale: 16
    t.integer "state"
    t.datetime "done_at"
    t.string "type", limit: 8
    t.integer "member_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "sn"
    t.string "source", null: false
    t.string "ord_type", limit: 10
    t.decimal "locked", precision: 32, scale: 16
    t.decimal "origin_locked", precision: 32, scale: 16
    t.decimal "funds_received", precision: 32, scale: 16, default: "0.0"
    t.integer "trades_count", default: 0
    t.index ["currency", "state"], name: "index_orders_on_currency_and_state"
    t.index ["member_id", "state"], name: "index_orders_on_member_id_and_state"
    t.index ["member_id"], name: "index_orders_on_member_id"
    t.index ["state"], name: "index_orders_on_state"
  end

  create_table "partial_trees", id: :serial, force: :cascade do |t|
    t.integer "proof_id", null: false
    t.integer "account_id", null: false
    t.text "json", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "sum"
  end

  create_table "payment_addresses", id: :serial, force: :cascade do |t|
    t.integer "account_id"
    t.string "address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "currency"
  end

  create_table "payment_transactions", id: :serial, force: :cascade do |t|
    t.string "txid"
    t.decimal "amount", precision: 32, scale: 16
    t.integer "confirmations"
    t.string "address"
    t.integer "state"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "receive_at"
    t.datetime "dont_at"
    t.integer "currency"
    t.string "aasm_state"
    t.string "type", limit: 60
    t.integer "txout"
    t.index ["txid", "txout"], name: "index_payment_transactions_on_txid_and_txout"
    t.index ["type"], name: "index_payment_transactions_on_type"
  end

  create_table "proofs", id: :serial, force: :cascade do |t|
    t.string "root"
    t.integer "currency"
    t.boolean "ready", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "sum"
    t.text "addresses"
    t.string "balance", limit: 30
  end

  create_table "read_marks", id: :serial, force: :cascade do |t|
    t.integer "readable_id"
    t.integer "member_id", null: false
    t.string "readable_type", limit: 20, null: false
    t.datetime "timestamp"
    t.index ["member_id"], name: "index_read_marks_on_member_id"
    t.index ["readable_type", "readable_id"], name: "index_read_marks_on_readable_type_and_readable_id"
  end

  create_table "running_accounts", id: :serial, force: :cascade do |t|
    t.integer "category"
    t.decimal "income", precision: 32, scale: 16, default: "0.0", null: false
    t.decimal "expenses", precision: 32, scale: 16, default: "0.0", null: false
    t.integer "currency"
    t.integer "member_id"
    t.string "source_type"
    t.integer "source_id"
    t.string "note"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["member_id"], name: "index_running_accounts_on_member_id"
    t.index ["source_type", "source_id"], name: "index_running_accounts_on_source_type_and_source_id"
  end

  create_table "signup_histories", id: :serial, force: :cascade do |t|
    t.integer "member_id"
    t.string "ip"
    t.string "accept_language"
    t.string "ua"
    t.datetime "created_at"
    t.index ["member_id"], name: "index_signup_histories_on_member_id"
  end

  create_table "simple_captcha_data", id: :serial, force: :cascade do |t|
    t.string "key", limit: 40
    t.string "value", limit: 6
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["key"], name: "idx_key"
  end

  create_table "taggings", id: :serial, force: :cascade do |t|
    t.integer "tag_id"
    t.string "taggable_type"
    t.integer "taggable_id"
    t.string "tagger_type"
    t.integer "tagger_id"
    t.string "context", limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
  end

  create_table "tags", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "tickets", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.string "aasm_state"
    t.integer "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tokens", id: :serial, force: :cascade do |t|
    t.string "token"
    t.datetime "expire_at"
    t.integer "member_id"
    t.boolean "is_used", default: false
    t.string "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["type", "token", "expire_at", "is_used"], name: "index_tokens_on_type_and_token_and_expire_at_and_is_used"
  end

  create_table "trades", id: :serial, force: :cascade do |t|
    t.decimal "price", precision: 32, scale: 16
    t.decimal "volume", precision: 32, scale: 16
    t.integer "ask_id"
    t.integer "bid_id"
    t.integer "trend"
    t.integer "currency"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "ask_member_id"
    t.integer "bid_member_id"
    t.decimal "funds", precision: 32, scale: 16
    t.index ["ask_id"], name: "index_trades_on_ask_id"
    t.index ["ask_member_id"], name: "index_trades_on_ask_member_id"
    t.index ["bid_id"], name: "index_trades_on_bid_id"
    t.index ["bid_member_id"], name: "index_trades_on_bid_member_id"
    t.index ["created_at"], name: "index_trades_on_created_at"
    t.index ["currency"], name: "index_trades_on_currency"
  end

  create_table "two_factors", id: :serial, force: :cascade do |t|
    t.integer "member_id"
    t.string "otp_secret"
    t.datetime "last_verify_at"
    t.boolean "activated"
    t.string "type"
    t.datetime "refreshed_at"
  end

  create_table "versions", id: :serial, force: :cascade do |t|
    t.string "item_type", null: false
    t.integer "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object"
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

  create_table "withdraws", id: :serial, force: :cascade do |t|
    t.integer "account_id"
    t.decimal "amount", precision: 32, scale: 16
    t.string "fund_uid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "txid"
    t.string "fund_extra"
    t.datetime "done_at"
    t.integer "member_id"
    t.integer "currency"
    t.decimal "fee", precision: 32, scale: 16
    t.string "sn"
    t.string "aasm_state"
    t.decimal "sum", precision: 32, scale: 16, default: "0.0", null: false
    t.string "type"
  end

end
