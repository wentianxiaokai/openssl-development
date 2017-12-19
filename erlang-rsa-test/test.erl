
-module(test).
-export([test/0]).

test() ->

	% io:format("111 ~n "),
	% Path = "./private_3.pem",
	% {ok, RSAPriPem} = file:read_file(Path),
	% PriPemEntries   = public_key:pem_decode(RSAPriPem),
	% RSAPriKey       = public_key:pem_entry_decode(hd(PriPemEntries)),
	% Data = <<97,82,218,11,105,40,98,17,74,83,200,72,220,84,111,208,31,167,35,151,110,55,74,62,6,197,156,102,37,74,129,65,111,74,179,200,221,50,112,245,213,249,229,241,45,253,32,237,209,135,213,230,174,96,164,11,134,150,251,48,171,226,163,98,65,162,220,116,59,159,21,155,0,166,40,210,140,19,4,7,187,106,80,171,149,161,199,217,53,62,247,14,105,186,183,195,18,22,236,45,228,12,210,37,204,186,172,128,12,246,132,47,104,20,147,114,46,185,163,185,236,102,185,196,117,24,16,114,120,117,138,247,111,231,59,78,14,221,217,42,18,146,55,19,58,38,28,129,149,197,128,192,237,125,167,152,244,105,244,95,82,172,84,215,34,28,245,114,87,145,110,220,236,108,243,20,215,211,112,45,41,182,141,75,121,174,97,63,12,161,248,180,225,120,136,118,171,238,126,156,196,75,86,24,72,143,4,244,42,170,4,99,254,239,88,1,29,192,95,191,252,64,155,242,175,204,177,96,83,204,86,138,243,62,202,11,228,57,42,21,36,220,14,140,170,100,35,70,176,39,229,171,25,47,41,237>>,

	% Data0      = public_key:decrypt_private(Data, RSAPriKey),
	% io:format("origin data:~p~n", [Data]),
	% io:format("RSAPriKey:~300p~n", [RSAPriKey]),
	% io:format("data0:~500p~n", [Data0]).



	Path2 = "./public_3.pem",
	{ok, RSAPubPem} = file:read_file(Path2),
	PubPemEntries   = public_key:pem_decode(RSAPubPem),
	RSAPubKey       = public_key:pem_entry_decode(hd(PubPemEntries)),
	

	Path = "./private_3.pem",
	{ok, RSAPriPem} = file:read_file(Path),
	PriPemEntries   = public_key:pem_decode(RSAPriPem),
	RSAPriKey       = public_key:pem_entry_decode(hd(PriPemEntries)),
	t(<<"1234567890">>,RSAPubKey,RSAPriKey),
	t(<<"1234567890abc">>,RSAPubKey,RSAPriKey),
	t(<<"1234567890123">>,RSAPubKey,RSAPriKey),
	t(<<"12345678902222222">>,RSAPubKey,RSAPriKey),

    ok.

t(Data,RSAPubKey,RSAPriKey)	->
	EncodeData = public_key:encrypt_public(Data, RSAPubKey),
    io:format("****  Data:~p~n", [ Data]),
    io:format("result is ~p ~n", [EncodeData ]),
	DecodeData = public_key:decrypt_private(EncodeData, RSAPriKey),
	io:format("----- data:~500p~n", [DecodeData])
	.
