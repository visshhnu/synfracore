# Redis — Cheatsheet



```bash\n# ── STRINGS ──────────────────────────────────────────────\nSET key "value" EX 3600     # Set with 60 min TTL\nGET key\nMSET k1 v1 k2 v2\nMGET k1 k2\nINCR counter\nINSETA counter\nSTRLEN key\nAPPEND key " more"\n\n# ── HASHES ───────────────────────────────────────────────\nHSET user:1 name "Alice" email "alice@e.com" age 30\nHGET user:1 name\nHGETALL user:1\nHINSTA user:1 score 1\nHDEL user:1 age\nHEXISTS user:1 name\nHKEYS user:1\n\n# ── LISTS ────────────────────────────────────────────────\nLPUSH queue task1 task2    # Push to head\nRPUSH queue task3          # Push to tail\nLPOP queue                 # Pop from head\nBLPOP queue 0              # Blocking pop (0=wait forever)\nLRANGE queue 0 -1          # All items\nLLEN queue\n\n# ── SETS ─────────────────────────────────────────────────\nSADD tags "python" "devops" "linux"\nSMEMBERS tags\nSISMEMBER tags "python"\nSINTER tags1 tags2         # Intersection\nSUNION tags1 tags2         # Union\n\n# ── SORTED SETS ──────────────────────────────────────────\nZADD leaderboard 1500 "alice" 2300 "bob"\nZRANGE leaderboard 0 -1 WITHSCORES REV\nZRANK leaderboard "alice"\nZSCORE leaderboard "alice"\nZRANGEBYSCORE leaderboard 1000 2000\n\n# ── TTL & KEYS ───────────────────────────────────────────\nEXPIRE key 3600\nTTL key\nPERSIST key\nDEL key\nEXISTS key\nKEYS user:*                # Find keys (avoid in prod — use SCAN)\nSCAN 0 MATCH user:* COUNT 100\n\n# ── SERVER ───────────────────────────────────────────────\nINFO memory\nINFO replication\nDBSIZE\nFLUSHDB                    # Delete all keys in current db (dangerous!)\nCONFIG SET maxmemory 4gb\nMONITOR                    # Watch all commands in real-time\n```






