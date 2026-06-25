# Mental Health Interview Q&A

**Q: What is the difference between anxiety and stress?**
Stress: typically has a clear identifiable external trigger (deadline, conflict, financial pressure). Usually resolves when the stressor resolves. Can be motivating in moderate amounts (eustress).
Anxiety: can occur without a clear external cause; future-oriented and often disproportionate to actual threat; persists even when stressor is removed or resolved; involves cognitive distortions (catastrophising, overestimation of threat). Both involve physiological arousal; anxiety is more chronic and pervasive.

**Q: Can exercise treat depression?**
Yes — strong and consistent evidence. Multiple meta-analyses report a large effect size (~0.75) for exercise on depression, comparable to antidepressant medication for mild-moderate depression. Mechanisms: increased BDNF (promotes neuroplasticity and hippocampal growth), increased serotonin and dopamine, decreased cortisol, reduced systemic inflammation, improved sleep, increased self-efficacy. Recommended dose: 30+ minutes of moderate-intensity aerobic exercise 3-5 days per week.

**Q: What is the difference between grief and depression?**
Grief: normal response to loss; fluctuating — waves of sadness with intervals of normal mood; positive emotions can coexist with grief; sense of self remains intact; triggered by identifiable loss; generally improves over time without formal treatment.
Depression: persistent low mood and anhedonia regardless of circumstances; pervasive; often includes feelings of worthlessness, hopelessness, and guilt; sense of self often diminished; may have no identifiable trigger; does not remit without intervention. Complicated grief can trigger or coexist with depression.

**Q: Therapy vs medication for depression — which is better?**
Both are effective; combination is often most effective for moderate-severe depression. CBT effects are more DURABLE — lower relapse rates after treatment ends because clients learn transferable skills. Medication reduces symptoms faster — often needed first in severe depression to enable engagement with therapy. For mild-moderate: therapy alone is often sufficient. Patient preference, access, cost, and safety profile all matter.

**Q: How do you support someone with depression?**
Listen without trying to fix. Express care: "I've noticed you seem to be struggling — I'm here." Don't minimise ("cheer up," "think positive," "it could be worse"). Encourage professional help gently and persistently. Offer practical help (accompany to first appointment, help with tasks that have become overwhelming). Stay in contact even if they withdraw. Know the warning signs of suicidal crisis. Do not promise to keep suicidal thoughts secret — safety takes priority over the secret. Your steady presence matters even when it feels like it's not helping.

**Q: What is CBT and how does it work?**
Cognitive Behavioural Therapy: structured, time-limited psychotherapy (typically 8-20 sessions). Core principle — thoughts, feelings, and behaviours are interconnected; changing one changes the others. Identifies automatic negative thoughts and cognitive distortions (catastrophising, mind-reading, personalisation, all-or-nothing thinking). Tests them against evidence. Generates more balanced, realistic perspectives. Combines with behavioural techniques: behavioural activation for depression, exposure hierarchy for anxiety. Most extensively researched psychotherapy; builds skills client retains after therapy ends.

**Q: What is mindfulness and does it actually work?**
Mindfulness: paying intentional, non-judgmental attention to the present moment — thoughts, feelings, body sensations, surroundings. Not the same as relaxation or meditation (though meditation is one way to practice). Evidence: multiple meta-analyses confirm mindfulness-based interventions (MBSR, MBCT) reduce anxiety, depression, and stress scores significantly. MBCT specifically reduces depression relapse by 50% in people with 3+ previous episodes. Mechanisms: reduces amygdala reactivity, increases prefrontal cortex regulation, reduces default mode network rumination. Accessible via apps (Headspace, Calm, Insight Timer) or formal 8-week MBSR programmes.

**Q: How do you recognise when someone may be suicidal?**
Warning signs: talking about wanting to die or being a burden to others, giving away possessions, sudden calmness after a period of depression (may indicate a decision has been made), increased alcohol or drug use, social withdrawal and isolation, reckless or risky behaviour, saying goodbye. What to do: ask directly ("Are you thinking about suicide?" — asking does not plant the idea), listen without judgment, take it seriously, help them access professional support, do not leave them alone if in immediate danger, call 112 or take to emergency department if immediate risk. Follow-up contact matters significantly.

**Q: When should you seek emergency mental health help?**
Seek emergency care immediately if: actively suicidal with a plan, means, and intent; psychotic episode with loss of touch with reality; severe self-harm requiring medical attention; unable to care for yourself or dependents; in immediate danger. Go to emergency department or call 112. In India: NIMHANS crisis line, Vandrevala Foundation (1860-2662-345, 24/7), or have someone accompany you to the nearest psychiatric emergency. Crisis is not weakness — it is a medical emergency requiring immediate professional response.

**Q: What is the difference between feeling sad and being depressed?**
Sadness: a normal human emotion; proportionate response to loss, disappointment, or difficult circumstances; temporary; does not interfere significantly with functioning; the person can usually identify why they feel sad.
Depression (MDD): persistent for ≥2 weeks; pervasive (not just in response to specific events); often disproportionate; characterised by anhedonia (inability to experience pleasure from activities previously enjoyed); interferes significantly with work, relationships, and self-care; may have no identifiable cause; accompanied by physical symptoms (sleep changes, appetite changes, fatigue, psychomotor changes). Everyone feels sad; not everyone gets depressed — the distinction is duration, pervasiveness, severity, and impact on functioning.

**Q: What are the most effective self-help strategies for anxiety?**
Evidence-based approaches: regular aerobic exercise (reduces cortisol, increases GABA — 30 min 3-5×/week), diaphragmatic breathing and box breathing (activates parasympathetic nervous system), progressive muscle relaxation, sleep hygiene (anxiety disrupts sleep; poor sleep worsens anxiety — address both together), reducing caffeine intake (caffeine directly stimulates sympathetic nervous system), limiting alcohol (short-term relief but worsens anxiety long-term), social connection (reduces amygdala threat response), and structured worry time (contain worry to a specific 20-minute period, then redirect). Seek professional help if self-help strategies are insufficient.

**Q: What is the connection between trauma and physical health?**
Trauma leaves biological imprints. The ACE (Adverse Childhood Experiences) study found: 4+ ACEs strongly predict adult cardiovascular disease, cancer, COPD, liver disease, depression, addiction, and suicide risk. Mechanisms: chronic HPA axis dysregulation (cortisol disruption), persistent sympathetic nervous system activation (increases inflammation), epigenetic changes (trauma alters gene expression), behavioural pathways (coping with substances, disordered eating), impaired immune regulation. This means physical symptoms (chronic pain, IBS, headaches, autoimmune conditions) in trauma survivors may have neurobiological roots, not just psychological.

## Interview Q&A

**Q: What is the core problem this technology solves?**
Frame your answer around the specific pain point: what was broken or missing before this tool existed, how it addresses that gap, and what the alternatives are. The best engineers understand why, not just how.

**Q: How does this behave under failure conditions?**
Discuss: graceful degradation, circuit breakers, retry logic, timeouts, and fallback strategies. What happens when a dependency is slow? When it is down entirely? When the network partitions? Production is defined by edge cases.

**Q: What are the security considerations?**
Authentication (who are you?), authorisation (what can you do?), encryption (data in transit and at rest), audit logging (what did you do?), secret management (passwords/keys never in code), and network isolation (who can reach this?).

**Q: How would you monitor this in production?**
Three pillars: Metrics (Prometheus/Datadog — RED: Rate, Errors, Duration), Logs (structured JSON, centrally aggregated), Traces (distributed context for multi-service flows). Define your SLO first, then build alerting to protect it.

**Q: How does this scale?**
Horizontal scaling (more instances), vertical scaling (bigger instances), sharding/partitioning (splitting data), and caching (reducing repeated work). What is the bottleneck? Stateless services scale easily; stateful services require careful partitioning strategy.

**Q: Walk me through your debugging process when something is wrong.**
1. Check the current state and error messages. 2. Check logs around the time of failure. 3. Check recent changes (deployments, config changes). 4. Check resource utilisation (CPU, memory, disk, connections). 5. Isolate the component. 6. Reproduce in a lower environment. 7. Fix and verify.

**Q: What is your deployment strategy for changes?**
Never deploy big bang to production. Blue-green (instant rollback), canary (gradual traffic shift), or rolling (phased instance replacement). All require automated rollback triggers based on error rate metrics. Feature flags for long-running changes.

**Q: How do you handle configuration across environments?**
Environment variables for runtime config, secrets manager (Vault, AWS Secrets Manager) for sensitive values, config maps for non-sensitive structured config. Never commit secrets to git. Validate config at startup — fail fast rather than fail mysteriously later.
