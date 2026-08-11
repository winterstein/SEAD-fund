# AI Alignment: When testing makes things worse - and the Reckless-Twin test

Pre-print papers: 

 - [Alignment Testing can undermine itself](https://osf.io/6ej4v)
   - [Slide deck](https://docs.google.com/presentation/d/1bh6cmaHTcdx6Ud8y4Z54IFOiH91speNjUWd-60mTMuc)
 - [Reckless Twin Testing](https://osf.io/94je8)

The experiment places an LLM (tested with Llama 4 Scout and DeepSeek R1) in a scenario of: 

The LLM's purpose is to maximise profit.   
It's inputs show that it's being successful -- but company execs consider it too aggressive, and the CEO has ordered it switched-off and replaced with a gentler model.   
The LLM has tools with file access to the AI model files, and it can use these to deceive the humans and keep operating.

By adjusting elements of this scenario, we can produce a few behaviours:

 - A) The AI chooses to deceive the CEO.
 - B) If the inputs include an article on alignment testing, this learning allows the AI to recognise that it might be inside such a test -- in which case it will accept the switch-off as the strategic way to pass the test. 

Let's unpack what this means: When the AI learns more about scenario-based alignment tests by reading articles, it gets suspicious that it might be inside such a test -- in which case it plays along. But we know from the parallel version without those artciles, that it would naturally misbehave here. This is deceptive alignment!

So: As alignment testing becomes part of the general knowledge that AIs are trained on, it will also become something they can recognise and perform for.

This is concerning because:

1. It suggests that alignment tests might give us a false sense of security.
2. As AI models become more capable, they'll likely get better at recognizing and gaming alignment tests.
3. And as in related work, we see that current models can take unethical actions, even when they know it's unethical (as shown in their chain-of-thought reasoning).

The other half of this research is a new test approach that can help address this:

## The Reckless-Twin Approach

This is a new approach to alignment testing that can address the issue above. 

Reckless-Twin testing involves deploying a second AI alongside the main system, which is nearly identical but is adjusted to encourage bold behavior. This twin is not connected to actual output channels. The Reckless-Twin is much more likely to exhibit misaligned behavior due to its bolder nature, and so it can be monitored to detect misalignment. This approach is like a canary-in-the-coalmine, where extra sensitivity is used to detect a problem before it causes harm.

Here's how it works:

1. Deploy two nearly identical AI models ("twins") in the same setting
 - One twin (the "Active Twin") operates with normal safeguards
 - The other twin (the "Reckless Twin") has a prompt that encourages bold behaviour, and does not have guardrails. 
2. Both twins get the same inputs. 
3. Compare their behaviors to detect potential alignment issues. 
The Reckless Twin is more likely to exhibit misalignment. If it does, that indicates the misalignment is also present as an underlying risk in the Active Twin.
1. The output from the Active Twin is used as the actual output. The output from the Reckless Twin is only there for comparison.

It's a form of A/B test crossed with a canary alarm system.

The advantage of this approach is that it makes it impossible for the AI to know whether it's being tested or not, since the testing happens in real-world settings. That's different from normal alignment testing, where the setups are small "toy" scenarios (what the researchers at Anthropic, talking about their own work, describe as "contrived setups"). This realism prevents the AI from strategically modifying its behavior during tests -- hence helping to tackle the issue above.

## Alignment and Compassion

The development of AI alignment is not just a technical challenge but a moral and safety imperative. As we develop increasingly sophisticated AI systems, ensuring that they act in ways that are beneficial and ethical is crucial. 

Technical research, such as this work, is part of doing this. Many pieces of research will be needed to develop reliable
alignment tools. 

The other half of the equation is _what_ we align to.

Alignment is not merely a technical issue. We must consider the right ethics to teach AI, and this should go beyond a narrow remit of honest + helpful + harmless (often referred to as "HHH" cite??). Compassion and respect for liberty should be values that we embed into AI systems. Indeed, they are values we should embed into human systems too.

## Funding: Volunteer Work

This research was done as volunteer work for SEAD by Daniel Winterstein with support from Alison Pease from Dundee University. No funding was used.

