open Printf

let () = Random.self_init ()
let rint a b = a + Random.int (b - a + 1)
let rbool p = Random.float 1.0 < p
let choice arr = arr.(Random.int (Array.length arr))
let clamp x lo hi = max lo (min hi x)

type day_state = {
  mutable score : int;
  mutable notes : string list;
}

let init_state () = { score = 0; notes = [] }

let log st t msg =
  st.notes <- st.notes @ [sprintf "%s  %s" t msg]

let bump st delta t why =
  st.score <- st.score + delta;
  log st t (sprintf "%s (impact %+d)" why delta)

let hr () = print_endline "--------------------------------------------------------------------"

let print_timeline st =
  hr ();
  print_endline "Timeline of Events";
  hr ();
  List.iter print_endline st.notes;
  hr ();
  printf "Momentum score: %d\n" st.score;
  hr ();
  print_endline ""

let morning st =
  match rint 1 4 with
  | 1 -> bump st (-5) "07:10" "Restless night reduces focus"
  | 2 -> bump st 0    "07:25" "Average rest, neutral energy"
  | 3 -> bump st 5    "07:30" "Solid rest supports clarity"
  | _ -> bump st 9    "07:35" "Excellent rest sharpens concentration";

  if rbool 0.6 then
    bump st 6 "08:05" "Morning exercise steadies rhythm"
  else
    bump st (-3) "08:05" "Exercise skipped, restlessness grows";

  begin match rint 1 3 with
  | 1 -> bump st 2 "08:35" "Balanced breakfast sustains energy"
  | 2 -> bump st 0 "08:35" "Quick coffee keeps pace"
  | _ -> bump st (-4) "08:35" "Rushed start weakens attention"
  end

let midday st =
  match rint 1 5 with
  | 1 -> bump st (-8) "11:15" "Unexpected issue disrupts flow"
  | 2 -> bump st (-3) "11:30" "Ambiguity slows progress"
  | 3 -> bump st 0    "11:40" "Routine workload, stable momentum"
  | 4 -> bump st 6    "11:45" "Work advances smoothly"
  | _ -> bump st 11   "11:55" "Strong success reinforces confidence";

  if rbool 0.5 then
    bump st 4 "12:20" "Earlier exchange with Ali felt natural"
  else
    bump st 0 "12:20" "No exchange, equilibrium maintained"

let afternoon st =
  if rbool 0.4 then
    bump st 7 "15:10" "Unexpected free time opens later window"
  else
    bump st 0 "15:10" "Schedule stays fixed";

  match rint 1 3 with
  | 1 -> bump st 8 "16:00" "Positive remarks from peers improve standing"
  | 2 -> bump st 0 "16:00" "Neutral interactions maintain balance"
  | _ -> bump st (-5) "16:00" "Background tension weighs down";

  if rbool 0.3 then
    bump st (-4) "16:45" "Minor delay intrudes on evening"
  else
    bump st 3 "16:45" "Tasks align neatly with evening plans"

let preparation st =
  let venue =
    choice [|
      "a quiet cafe with steady atmosphere";
      "a park path with open space";
      "a lobby corner with minimal noise";
      "a bookstore alcove with natural privacy"
    |]
  in
  log st "18:05" (sprintf "Setting chosen: %s" venue);

  match rint 1 4 with
  | 1 -> bump st 9 "18:20" "Plans simplified into clear intention"
  | 2 -> bump st 4 "18:20" "Excess language removed, focus regained"
  | 3 -> bump st 0 "18:20" "Approach left unscripted, neutral impact"
  | _ -> bump st (-3) "18:20" "Overthinking dulls intent slightly"

let approach st =
  let style =
    choice [|
      ("direct", 10, "Steady pace and plain delivery");
      ("measured", 5, "Balanced context and clarity");
      ("circumspect", 0, "Even tone without pressure");
      ("hesitant", -5, "Overly softened until near delay")
    |]
  in
  let style_name, style_delta, desc = style in
  bump st style_delta "19:05" (sprintf "Approach style: %s (%s)" style_name desc);

  let (delta, desc2) =
    choice [|
      (-6, "A small interruption unsettles flow");
      (-2, "Minor hesitation stretches the pause");
      (0,  "Neutral cadence, steady outcome");
      (4,  "Well-timed pause reinforces intent");
      (7,  "Smooth timing strengthens delivery")
    |]
  in
  bump st delta "19:07" desc2

let outcome st =
  let s = clamp st.score (-30) 30 in
  hr ();
  print_endline "Outcome";
  hr ();
  if s >= 15 then
    print_endline "Ali accepts the plan for a meeting. The day’s momentum carried steadily."
  else if s >= 5 then
    print_endline "Ali indicates openness, agreeing to meet in a limited way."
  else if s >= (-5) then
    print_endline "Ali withholds a decision, leaving the matter unresolved."
  else if s >= (-15) then
    print_endline "Ali declines politely, keeping the exchange steady."
  else
    print_endline "Ali declines firmly, clarity overriding uncertainty.";
  print_endline "";
  print_timeline st

let run () =
  let st = init_state () in
  log st "07:00" "Day begins";
  morning st;
  midday st;
  afternoon st;
  preparation st;
  approach st;
  outcome st

let () = run ()
