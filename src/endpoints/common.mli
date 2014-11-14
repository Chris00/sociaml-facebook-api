type 'a decoder = ('a, Tiny_json.Json.t) Meta_conv.Types.Decoder.t

type 'a encoder = ('a, Tiny_json.Json.t) Meta_conv.Types.Encoder.t

type calendar_iso8601 = CalendarLib.Calendar.t

val calendar_iso8601_of_json : calendar_iso8601 decoder

val json_of_calendar_iso8601 : calendar_iso8601 encoder

type calendar_us_date = CalendarLib.Calendar.t

val calendar_us_date_of_json : calendar_us_date decoder

val json_of_calendar_us_date : calendar_us_date encoder
  
type uri = Uri.t

val uri_of_json : uri decoder

val json_of_uri : uri encoder

type csv = Csv.t

val csv_of_json : csv decoder

val json_of_csv : csv encoder


module NumberRange : sig
  type t = {
    min            : int;
    max            : int;
  }
end


module type PagedResponse = sig
  
  type data
	
	type cursors = {
		after          : string;
		before         : string;
  }
  
  type page_navigation = {
    next           : uri option;
    previous       : uri option;
		cursors        : cursors option;
  } 
  
  type t = { 
    data           : data list; 
    paging         : page_navigation option; 
  }
  
  val t_of_json    : t decoder
  
  val json_of_t    : t encoder
  
end