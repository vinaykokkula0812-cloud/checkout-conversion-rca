# Checkout Conversion Drop – Root Cause Analysis

## Problem
A sudden decline in purchase conversion was observed in a marketplace platform.
The goal was to identify the root cause and recommend corrective actions.

## Metrics
- Purchase Conversion Rate
- Funnel: Visit → Add to Cart → Checkout → Purchase
- Guardrails: Payment Failure Rate

## Data
Event-level user interaction data across web and mobile platforms.

## Approach
1. Validated the conversion drop using pre/post analysis
2. Decomposed the funnel to isolate the failing step
3. Segmented conversion by device
4. Analyzed payment failure events

## Key Findings
- Checkout → Purchase conversion dropped significantly
- Desktop funnel remained stable
- Mobile payment failures spiked post-release

## Recommendation
Roll back the mobile checkout release and hotfix the payment gateway.
Introduce guardrail monitoring for payment failures.

## Tools
- SQL
- Product Analytics Frameworks
