
-module(test).
-export([test/0]).

test() ->
	io:format("111 ~n "),
	Path = "./private_2.pem",
	{ok, RSAPriPem} = file:read_file(Path),
	io:format("222 ~n "),
	PriPemEntries   = public_key:pem_decode(RSAPriPem),
	io:format("333 ~n "),
	RSAPriKey       = public_key:pem_entry_decode(hd(PriPemEntries)),
	io:format("444 ~n "),
	Data = <<"1234567890">>,

	% Data      = public_key:decrypt_private(Data0, RSAPriKey),
io:format("~n~n~n +++++++++++++ ~n~n~n"),

	EncodeData = public_key:encrypt_private(Data, RSAPriKey),
	io:format("origin data:~p~n", [Data]),
	io:format("RSAPriKey:~300p~n", [RSAPriKey]),
	io:format("encrypt data:~500p~n", [EncodeData]),

io:format("~n~n~n ============ ~n~n~n"),
	
	% Path2 = "./public_2.pem",
	% {ok, RSAPubPem} = file:read_file(Path2),
	% PubPemEntries   = public_key:pem_decode(RSAPubPem),
	% RSAPubKey       = public_key:pem_entry_decode(hd(PubPemEntries)),

	% DecodeData = public_key:decrypt_public(EncodeData, RSAPubKey),
 %    io:format("DecodeData:~p~n", [DecodeData]),
 %    io:format("result is ~p ~n", [DecodeData =:= Data]),
    ok.

