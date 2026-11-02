-- CreateSchema
CREATE SCHEMA IF NOT EXISTS "public";

-- CreateTable
CREATE TABLE "trade_transactions" (
    "id" BIGSERIAL NOT NULL,
    "action" VARCHAR(4) NOT NULL,
    "stock_id" VARCHAR(20) NOT NULL,
    "quantity" INTEGER NOT NULL,
    "rate" DECIMAL(14,4) NOT NULL,
    "gross_amount" DECIMAL(16,2) NOT NULL,
    "trade_date" DATE,
    "gmail_message_id" VARCHAR(64) NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "customer_id" VARCHAR(32) NOT NULL,

    CONSTRAINT "trade_transactions_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "idx_trade_transactions_customer_id" ON "trade_transactions"("customer_id");

-- CreateIndex
CREATE UNIQUE INDEX "uq_trade_per_email" ON "trade_transactions"("gmail_message_id", "action", "stock_id", "quantity", "rate");

