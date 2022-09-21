About "Layers".

This folder structure, nested layers, is an architectural experiment. I want to see if it helps to not "define" what a layer is for (eg. "data-access"), but to keep it more flexible, so that natural layers can evolve.

Normal 'layer' rules apply:
- Layers can call downward, to lower layers, but never upward.
- Layers can call siblings (but beware circular references)
- Layers are allowed to skip lower layers when calling downward.

Experiment:
Try keep modules very fine-grained. Eg, a single function per module is fine. So that callers can choose exactly which functions they need. (vs. keeping all text rendering things in one module

Experiment results:
- Numbered 'layer' folders: ???
- Very fine grained modules: ???