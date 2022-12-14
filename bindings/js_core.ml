(* This file is released under the terms of an MIT-like license.     *)
(* See the attached LICENSE file.                                    *)
(* Copyright 2016 by LexiFi.                                         *)

module Kinds = struct
  type unknown = Ojs.t [@@js]
  module Node = struct
    type element = Ojs.t [@@js]
    type text = Ojs.t [@@js]
    type comment = Ojs.t [@@js]
    type processing_instruction_node = Ojs.t [@@js]
    type document = Ojs.t [@@js]
    type document_type = Ojs.t [@@js]
    type document_fragment = Ojs.t [@@js]
    type deprecated = Ojs.t [@@js]
  end

  module Html = struct
    type body = Ojs.t [@@js]
    type input = Ojs.t [@@js]

    type table = Ojs.t [@@js]
    type tbody = Ojs.t [@@js]
    type td = Ojs.t [@@js]
    type th = Ojs.t [@@js]
    type thead = Ojs.t [@@js]
    type tr = Ojs.t [@@js]
  end
end

open Kinds

module Node : sig
  type 'a t = private Ojs.t
  val t_of_js: (Ojs.t -> 'a) -> Ojs.t -> 'a t
  val t_to_js: ('a -> Ojs.t) -> 'a t -> Ojs.t

  (** Node API *)

  val append_child: 'a t -> 'b t -> unit
  val base_URI: 'a t -> string
  val clone_node: 'a t -> 'a t
  val first_child: 'a t -> unknown t option
  val has_child_nodes: 'a t -> bool
  val last_child: 'a t -> unknown t option
  val remove_child: 'a t -> 'b t -> unit

  val set_text_content: 'a t -> string -> unit
  val get_text_content: 'a t -> string -> unit

  open Kinds.Node
  val node_type: 'a t ->
    [ `Element of element t
    | `Text of text t
    | `ProcessingInstructionNde of processing_instruction_node t
    | `Comment of comment t
    | `Document of document t
    | `DocumentType of document_type t
    | `DocumentFragment of document_fragment t
    | `Deprecated of deprecated t ]
end = struct
  include ([%js :
             type untyped = private Ojs.t
             val untyped_of_js: Ojs.t -> untyped
             val untyped_to_js: untyped -> Ojs.t

             val append_child: untyped -> untyped -> unit [@@js.call]
             val base_URI: untyped -> string [@@js.get]
             val clone_node: untyped -> untyped [@@js.get]
             val first_child: untyped -> untyped option [@@js.get]
             val has_child_nodes: untyped -> bool [@@js.get]
             val last_child: untyped -> untyped option [@@js.get]
             val node_type: untyped -> int [@@js.get]
             val remove_child: untyped -> untyped -> unit [@@js.call]

             val set_text_content: untyped -> string -> unit [@@js.set]
             val get_text_content: untyped -> string -> unit [@@js.call]
           ])
  type 'a t = untyped
  let t_of_js _ x = untyped_of_js x
  let t_to_js _ x = untyped_to_js x

  let node_type x =
    let open Kinds.Node in
    match node_type x with
    | 1 -> `Element (x : element t)
    | 3 -> `Text (x : text t)
    | 7 -> `ProcessingInstructionNde (x : processing_instruction_node t)
    | 8 -> `Comment (x : comment t)
    | 9 -> `Document (x : document t)
    | 10 -> `DocumentType (x : document_type t)
    | 11 -> `DocumentFragment (x: document_fragment t)
    | _ -> `Deprecated (x: deprecated t)
end

module Element : sig
  type 'a t = Kinds.Node.element Node.t
  val t_of_js: (Ojs.t -> 'a) -> Ojs.t -> 'a t
  val t_to_js: ('a -> Ojs.t) -> 'a t -> Ojs.t

  val has_attribute: 'a t -> string -> bool
  val set_attribute: 'a t -> string -> string -> unit
  val get_attribute: 'a t -> string -> string
  val remove_attribute: 'a t -> string -> unit

  val set_class_name: 'a t -> string -> unit
  val get_class_name: 'a t -> string

  val set_innerHTML:  'a t -> string -> unit
  val inner_HTML: 'a t -> string

  val set_outer_HTML: 'a t -> string -> unit
  val outer_HTML: 'a t -> string

  val set_onclick: 'a t -> (unit -> unit) -> unit
  val set_onmouseover: 'a t -> (unit -> unit) -> unit

  val unsafe_cast: 'a t -> 'b t
  val tag_name: 'a t -> string
end = struct
  include [%js :
             type untyped = Kinds.Node.element Node.t
             val untyped_of_js: Ojs.t -> untyped
             val untyped_to_js: untyped -> Ojs.t

             val has_attribute: untyped -> string -> bool [@@js.call]
             val set_attribute: untyped -> string -> string -> unit [@@js.call]
             val get_attribute: untyped -> string -> string [@@js.call]
             val remove_attribute: untyped -> string -> unit [@@js.call]

             val set_class_name: untyped -> string -> unit [@@js.set]
             val get_class_name: untyped -> string [@@js.get]

             val set_innerHTML:  untyped -> string -> unit [@@js.set]
             val inner_HTML: untyped -> string [@@js.get]

             val set_outer_HTML: untyped -> string -> unit [@@js.set]
             val outer_HTML: untyped -> string [@@js.get]

             val set_onclick: untyped -> (unit -> unit) -> unit [@@js.set]
             val set_onmouseover: untyped -> (unit -> unit) -> unit [@@js.set]
             val tag_name: untyped -> string [@@js.get]
           ]
  type 'a t = untyped
  let t_of_js _ x = untyped_of_js x
  let t_to_js _ x = untyped_to_js x
  let unsafe_cast x = x
end

module Document = struct
  type t = Kinds.Node.document Node.t [@@js]

  include ([%js :
             val set_title: t -> string -> unit [@@js.set]
             val title: t -> string [@@js.get]

             val get_element_by_id: t -> string -> unknown Element.t option [@@js.call]
             val get_elements_by_class_name: t -> string -> unknown Element.t array [@@js.call]

             val create_element: t -> string -> unknown Element.t [@@js.call]
             val create_text_node: t -> string -> Kinds.Node.text Node.t [@@js.call]

             val body: t -> Kinds.Html.body Element.t [@@js.get]
           ])

  let create_html_input document =
    (create_element document "input"
     |> Element.unsafe_cast : Kinds.Html.input Element.t)
  let create_html_table document =
    (create_element document "table"
     |> Element.unsafe_cast : Kinds.Html.table Element.t)
  let create_html_tr document =
    (create_element document "tr"
     |> Element.unsafe_cast : Kinds.Html.tr Element.t)
  let create_html_td document =
    (create_element document "td"
     |> Element.unsafe_cast : Kinds.Html.td Element.t)
  let create_html_th document =
    (create_element document "th"
     |> Element.unsafe_cast : Kinds.Html.th Element.t)
  let create_html_tbody document =
    (create_element document "tbody"
     |> Element.unsafe_cast : Kinds.Html.tbody Element.t)
  let create_html_thead document =
    (create_element document "thead"
     |> Element.unsafe_cast : Kinds.Html.thead Element.t)
end

module Window = [%js :
  type t = private Ojs.t

  val t_of_js: Ojs.t -> t
  val t_to_js: t -> Ojs.t

  val document: t -> Document.t [@@js.get]

  val set_onload: t -> (unit -> unit) -> unit [@@js.set]
]

module Console = [%js :
  type t = private Ojs.t

  val t_of_js: Ojs.t -> t
  val t_to_js: t -> Ojs.t

  val log: t -> Ojs.t -> unit [@@js.call]

  val log_string: t -> string -> unit
  [@@js.call "log"]
]

module JSON = [%js :
  val parse: string -> Ojs.t
  [@@js.global "JSON.parse"]
  val stringify: Ojs.t -> string
  [@@js.global "JSON.stringify"]
]

module File = [%js :
  type t = private Ojs.t
  val t_of_js: Ojs.t -> t
  val t_to_js: t -> Ojs.t
  val name: t -> string [@@js.get]
]

module FileList = [%js :
  type t = private Ojs.t
  val t_of_js: Ojs.t -> t
  val t_to_js: t -> Ojs.t
  val item: t -> int -> File.t option [@@js.call]
  val length: t -> int [@@js.get]
]

module FileReader = struct
  type state =
    | Empty [@js 0]
    | Loading [@js 1]
    | Done [@js 2] [@@js] [@@js.enum]

  include [%js :
             type t = private Ojs.t
             val t_of_js: Ojs.t -> t
             val t_to_js: t -> Ojs.t
             val new_file_reader : unit -> t [@@js.new]
             val ready_state : t -> state [@@js.get]
             val result: t -> string option [@@js.get]
             val set_onload: t -> (unit -> unit) -> unit [@@js.set]
             val read_as_text: t -> File.t -> unit [@@js.call]
           ]
end

module Html = struct
  module Input = struct
    type t = Kinds.Html.input Element.t [@@js]
    include ([%js :
               val files: t -> FileList.t [@@js.get]
             ])
  end

  let retype x =
    match String.lowercase_ascii (Element.tag_name x) with
    | "input" -> `Input (Element.unsafe_cast x : Kinds.Html.input Element.t)
    | "table" -> `Table (Element.unsafe_cast x : Kinds.Html.table Element.t)
    | "tr" -> `Tr (Element.unsafe_cast x : Kinds.Html.tr Element.t)
    | "td" -> `Td (Element.unsafe_cast x : Kinds.Html.td Element.t)
    | "body" -> `Body (Element.unsafe_cast x : Kinds.Html.body Element.t)
    | "tbody" -> `Tbody (Element.unsafe_cast x : Kinds.Html.tbody Element.t)
    | "thead" -> `Thead (Element.unsafe_cast x : Kinds.Html.thead Element.t)
    | _ -> `Unknown
end

module GlobalVariables = [%js :
  val window: Window.t
  [@@js.global]

  val alert: string -> unit
  [@@js.global]

  val console: Console.t
  [@@js.global]
  ]
