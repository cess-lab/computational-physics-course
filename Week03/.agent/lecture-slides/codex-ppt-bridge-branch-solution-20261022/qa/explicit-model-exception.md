# Explicit model selection authorized by the lecturer

After parent inspection of worker turn_context records, all five first-batch slide workers were found to run gpt-5.6-luna at medium effort, despite the fork_turns=all inheritance guarantee in the tool description. The batch was rejected before PPTX assembly. Its images and recorded state were archived under rejected-inheritance-batch/.

The lecturer was informed of the model/effort mismatch and the exact-match rule, and explicitly selected:
“Pin GPT-6.1 Sol/high explicitly and regenerate five slides”.

This authorization overrides only the fork-and-inherit method for this deck. New workers use fork_turns=none, model=gpt-6.1-sol and reasoning_effort=high, with self-contained single-slide jobs. The coordinator remains unchanged. Built-in ImageGen edit backend, approved sample, scientific content, QA and state recording rules remain in force. Every new worker's actual turn_context must be verified before result acceptance.
