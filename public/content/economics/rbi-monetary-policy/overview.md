# RBI Monetary Policy — Deep Dive

**Before you start:** [Macroeconomics](/academies/economics/macro-economics/overview) (monetary policy basics, inflation) is assumed. *(Note: specific rate figures, remittance amounts, and quota percentages below reflect a point-in-time snapshot — RBI rates and international figures change regularly; verify current figures against RBI's latest monetary policy statement before relying on them.)*

## Why This Exists (The Hook)

A central bank's rate decisions can feel abstract — "RBI raised the repo rate by 25 basis points" means little without understanding the actual chain of consequences that follows: banks' own borrowing costs rise, they pass that through to loan rates, borrowing and spending slow down, and inflation (the original target) eases as a result. This page exists to make that transmission chain concrete rather than abstract — not just what RBI's tools are, but how each one actually reaches the real economy, and how long that reach takes.

## Monetary Policy Framework

India follows a **flexible inflation targeting** framework since 2016 (amended RBI Act, Section 45ZA).

**Target:** CPI inflation at 4% (tolerance band: 2%–6%)  
**Accountability:** If inflation breaches band for 3 consecutive quarters, RBI Governor must explain to government and suggest remedial actions.

---

**Analogy** — Think of monetary policy transmission like adjusting a thermostat that controls the whole house through a chain of connected systems, not a single switch. Turning the thermostat down doesn't instantly cool every room — it signals the furnace, which changes the air handler's output, which gradually changes room temperature over time, with each link in that chain adding delay. RBI's repo rate is the "thermostat setting" — it doesn't instantly change what a borrower pays; it works through a chain (repo → bank funding cost → MCLR → actual lending rates → borrowing behavior → GDP/inflation) where each link takes real time to respond, which is exactly why monetary policy changes take months to fully show up in the real economy, not days.

**Try it (2 minutes)** — Reason through why MCLR replaced the older "base rate" system specifically because it was "too slow to transmit RBI policy," without looking anything up: if RBI cuts the repo rate to stimulate borrowing and spending during a slowdown, but banks' own lending rates only adjust slowly and partially in response, what happens to how quickly RBI's intended stimulus actually reaches borrowers and the real economy? Given that monetary policy's effectiveness depends on this transmission actually happening at a reasonable speed, why would a benchmark (MCLR) explicitly designed for faster, more mechanical pass-through of RBI's rate changes be a meaningful structural improvement over one where banks had more discretion to delay adjusting their own rates?

## Monetary Policy Transmission

How RBI rate changes affect the real economy:

```flow
{
  "layout": "flow",
  "steps": [
    { "label": "RBI Cuts Repo Rate", "sublabel": "The policy lever", "color": "blue" },
    { "label": "Banks Cut MCLR", "sublabel": "Bank funding cost benchmark adjusts", "color": "purple" },
    { "label": "Lending Rates Fall", "sublabel": "Home, auto, corporate loans", "color": "amber" },
    { "label": "Borrowing & Spending Rise", "sublabel": "GDP growth, employment increase", "color": "green" }
  ]
}
```

```
RBI ↓ REPO RATE
    ↓
Banks ↓ MCLR (Marginal Cost of Funds based Lending Rate)
    ↓
Banks ↓ Interest rates on new loans (home loans, car loans, corporate)
    ↓
Consumers & Corporates borrow more → Spend more → Invest more
    ↓
GDP growth ↑ | Employment ↑
    ↓ (if too much)
Inflation risk ↑ → RBI raises rates again
```

**MCLR (Marginal Cost of Funds based Lending Rate):**
- Benchmark rate for bank lending since April 2016
- Based on: marginal cost of deposits + operating expenses + CRR adjustment + tenor premium
- Replaced base rate system (which was too slow to transmit RBI policy)

**EBLR (External Benchmark Linked Rate):** Since October 2019, floating rate retail loans (home, auto) must be linked to external benchmark (Repo rate, 91-day T-bill, or 182-day T-bill). Ensures faster transmission.

---

## Quantitative Easing vs Tightening

| Tool | Easing (expansion) | Tightening (contraction) |
|------|-------------------|-------------------------|
| Repo rate | Decrease | Increase |
| CRR | Decrease | Increase |
| OMO | Buy G-Sec (inject liquidity) | Sell G-Sec (absorb liquidity) |
| MSF | Lower rate | Higher rate |

---

## G-Secs and the Bond Market

**Government Securities (G-Secs):** Debt instruments issued by Central Government to fund fiscal deficit.
- **T-Bills:** Short term (91, 182, 364 days). Zero coupon (issued at discount, redeemed at face value).
- **Dated G-Secs:** Medium to long term (2–40 years). Pay semi-annual coupon (interest).
- **SDL (State Development Loans):** Similar to G-Secs but issued by State Governments. Slightly higher yield.

**Yield vs Price relationship:** Bond prices and yields move inversely.
- When RBI raises rates → existing bonds less attractive → prices fall → yields rise
- When RBI cuts rates → existing bonds more attractive → prices rise → yields fall

**Primary auction:** RBI auctions G-Secs to Primary Dealers (PDs) + banks. Cut-off yield = market-determined yield at which RBI accepts bids.

**Secondary market:** G-Secs traded on NDS-OM (Negotiated Dealing System - Order Matching). FIIs can invest up to limits set by RBI.

---

## Balance of Payments (BoP)

**Current Account:**
- Trade balance (goods): India typically runs a deficit (imports > exports)
- Services: India runs a surplus (IT services, tourism, education)
- Income: Interest/dividend payments
- Transfers: Remittances from NRIs (India receives ~$120 billion/year — world's largest recipient)

**Capital Account:**
- FDI (Foreign Direct Investment): Long-term investment in companies
- FPI (Foreign Portfolio Investment): Investment in stocks/bonds — more volatile
- External borrowings: ECB (External Commercial Borrowings)

**BoP deficit:** More foreign exchange leaving than entering → pressure on INR
**BoP surplus:** More entering → INR tends to appreciate

**RBI intervention:** RBI buys/sells USD in forex market to prevent sharp INR moves.

---

## International Economic Bodies & India

| Body | Role | India's position |
|------|------|----------------|
| IMF | Monetary stability, emergency lending | India holds ~2.75% quota, has ED on Board |
| World Bank | Development financing | India is largest borrower historically |
| ADB | Asia-Pacific development | India major beneficiary — infrastructure projects |
| WTO | Global trade rules | India active member, negotiates on agriculture |
| G20 | Economic coordination | India holds rotating presidency; 2023 New Delhi summit |
| BRICS | Emerging economies forum | Founder member; NDB (New Development Bank) HQ Shanghai |
| SCO | Security + economic cooperation | India member since 2017 |

---

## Economic Indicators Quick Reference

| Indicator | What it measures | Source | Frequency |
|-----------|-----------------|--------|-----------|
| GDP | Economic output | MoSPI | Quarterly |
| IIP (Index of Industrial Production) | Industrial output | MoSPI | Monthly |
| CPI | Retail inflation | CSO | Monthly |
| WPI | Wholesale prices | DPIIT | Monthly |
| PMI (Purchasing Managers Index) | Business activity | S&P Global | Monthly |
| Trade data | Imports/Exports | Commerce Ministry | Monthly |
| Forex reserves | Foreign exchange holdings | RBI | Weekly |
| Bank credit growth | Credit to economy | RBI | Fortnightly |
