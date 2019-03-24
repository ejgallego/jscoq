(* HTML log buffers
 *
 * Copyright (C) 2015 Mines ParisTech
 * Written by: Emilio J. Gallego Arias
 *
 * LICENSE: GPLv3+
 *)

(* HTML log buffers *)
type t = {
  buffer : Dom_html.element Js.t;
  append : bool;
}

(* XXX: Add a filter js button to ignore events *)
type log_level =
  | Debug
  | Info
  | Warn
  | Error

let init el app = {
  buffer = el;
  append = app;
}

let init_by_id id app =
  let b = Dom_html.getElementById id in
  init b app

let add lb _ll el =
  if lb.append then (
    Dom.appendChild lb.buffer el;
    lb.buffer##.scrollTop := lb.buffer##.scrollHeight
  ) else
    Dom.insertBefore lb.buffer el (lb.buffer##.firstChild)

let replace lb ll el =
  if lb.append then (
    Js.Opt.case (lb.buffer##.lastChild)
      (fun () -> add lb ll el)
      (fun rn -> Dom.replaceChild lb.buffer el rn);
    lb.buffer##.scrollTop := lb.buffer##.scrollHeight
  ) else (
    Js.Opt.case (lb.buffer##.firstChild)
      (fun () -> add lb ll el)
      (fun rn -> Dom.replaceChild lb.buffer el rn)
  )

let text s =
  Tyxml_js.Html5.(span ~a:[a_class []] [pcdata s])

let add_text lb ll msg =
  add lb ll (Tyxml_js.To_dom.of_element (text msg))

let replace_text lb ll msg =
  replace lb ll (Tyxml_js.To_dom.of_element (text msg))

let printf lb =
  Printf.ksprintf (add_text lb Info)

(* Replace the particular element *)
let printf_rep lb =
  Printf.ksprintf (replace_text lb Info)

(* jscoq internal log *)
let _jscoq_log : t =
  try
    init_by_id "message-panel"  false
  with Not_found ->
    init_by_id "jscoq-log-area" false
