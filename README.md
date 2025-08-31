## ali

<img width="500" height="500" alt="Quant Point (5)" src="https://github.com/user-attachments/assets/c9195138-108b-4d05-b407-706dddc73c45" />

To test how good some of our quant is working, myself and Alex decided to use a OCaml simulation that models a single day in the life of Alex as he considers asking Ali Michael out. The program unfolds through structured phases of the day, each shifting momentum toward one of several outcomes. The design emphasizes functional decomposition, state tracking, and timeline-based narrative rather than dialogue.

## Features

- **Functional structure** — morning, midday, afternoon, preparation, and approach are implemented as separate functions.  
- **Momentum scoring** — each event adjusts an internal score that reflects Alex’s position at the end of the day.  
- **Timeline logging** — prints a chronological sequence of events with timestamps and impact values.  
- **Outcome evaluation** — maps the final score into outcome bands ranging from strong acceptance to firm rejection.  
- **No dialogue** — the narrative remains descriptive, focused on cause and consequence.

---

## File

- `ali.ml` — main entry point, containing the entire simulation.

---

## Running The Simulation

Compile and run from the command line:

```bash
ocamlc -o ali unix.cma ali.ml
./ali
```
Then you'll be able to run the simulation. It should look something like this given you have the proper permissions: 

<img width="2179" height="1380" alt="output (18)" src="https://github.com/user-attachments/assets/48c23635-c177-46b4-b17d-e430ea9a03eb" />

Each function updates the mutable fields of a shared `day_state` record:

```ocaml
type day_state = {
  mutable score : int;          (* cumulative momentum score *)
  mutable notes : string list;  (* chronological event log *)
}
```

## Quant Table 

|   Outcome  | Score Range | Approx. Probability |              Interpretation             |
|:----------:|:-----------:|:-------------------:|:---------------------------------------:|
| Strong Yes | ≥ +15       | 25%                 | Clear, specific agreement to meet       |
| Soft Yes   | +5 .. +14   | 30%                 | Tentative but positive acceptance       |
| Undecided  | -5 .. +4    | 20%                 | Deferral; no closure, but no rejection  |
| Soft No    | -15 .. -6   | 15%                 | Polite refusal, maintaining equilibrium |
| Clear No   | ≤ -16       | 10%                 | Firm rejection, unambiguous and final   |

## The Ranges

As you can see the hypothetical interaction model between Alex and Ali Michael is formalized through a mutable `day_state` record whose score field represents cumulative conversational momentum and whose notes field preserves an ordered event log. Each function invocation mutates this shared state by incrementally shifting score according to event polarity (positive reinforcement, hesitation, or rejection), while appending structured trace data to notes. 

Mapping the evolving score against the defined quantization table yields a probabilistic forecast: ≥ `+15` indicates a `25%` likelihood of a _Strong Yes_ (explicit agreement), `+5..+14` maps to a `30%` likelihood of a Soft Yes (tentative acceptance), `-5..+4` aligns with a `20%` Undecided state (non-committal equilibrium), `-15..-6` corresponds to a `15%` Soft No (polite deferral), and `≤ -16` converges on a `10%` Clear No (terminal rejection). Thus, the stochastic process governing Alex’s chances with Ali Michael is reducible to deterministic state transitions combined with probabilistic outcome interpretation.

The post-mortem inspection I executed (Michael Mendy) of the trace reveals that once the score fell below `–10`, the slope of decline increased: every subsequent event carried a larger negative weight, as if Ali’s signals compounded in their refusal strength. In other words, denial is not a single event but a gradual convergence observable in the logs — the probability mass collapses into rejection space long before the explicit terminal event is logged, below is a graph I made to demonstrate this: 

<img width="1580" height="980" alt="output (18)" src="https://github.com/user-attachments/assets/5969543f-4c11-4451-9f05-e4beac28c038" />

The plot shows cumulative score values trending downward over ten events, crossing through the _Soft No_ band and eventually settling in the _Clear No_ absorbing state (`≤ –16`). The dashed lines mark the thresholds from the quant table, letting readers see exactly where the “post-mortem” trajectory sealed the outcome.

If you `tail -f` the logs, you'd see successive function calls mutating `day_state.score` that are trending essentially downward, each event log in notes providing a timestamped trace of conversational entropy. The monotonic decline in score reflects a consistent negative reinforcement loop, where each new interaction applies a decrement rather than an increment. Given the quantization thresholds, even a cursory observation shows convergence toward the _Soft No_ or _Clear No_ ranges. 

## Authors

Michael Mendy (c) 2025 // Alex Trostorff (c) 2025 // Quantum Point, LLC.

## Copyright 

_Quantum Point, LLC_ All Rights Reserved. (c) 2025.
